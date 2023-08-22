#!/bin/bash

echo "###################### Install Helm ######################"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# echo "###################### Install postgrel ######################"
# sudo helm install my-release oci://registry-1.docker.io/bitnamicharts/postgresql

echo "###################### Install Gitlab ######################"
kubectl create namespace gitlab
sudo helm repo add gitlab https://charts.gitlab.io/
sudo helm search repo gitlab
sudo helm repo update

sudo helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.hosts.domain=gitlab.fcatinau.com \
  --set global.hosts.externalIP=192.168.56.110 \
  --set certmanager-issuer.email=fcatinau@student.42.fr \
  --set global.hosts.https="false"\
  --set gitlab-runner.install="false" -n gitlab

echo -n "Gitlab password: "

kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -o jsonpath='{.data.password}' | base64 -d; echo

echo "Wait for deployement of GitLab"
kubectl wait -n gitlab --for=condition=available deployment --all --timeout=-1s
