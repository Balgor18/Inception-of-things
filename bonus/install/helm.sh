#!/bin/bash

echo "###################### Install Helm ######################"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# echo "###################### Install postgrel ######################"
# sudo helm install my-release oci://registry-1.docker.io/bitnamicharts/postgresql

echo "###################### Install Gitlab ######################"
sudo kubectl create namespace gitlab
sudo helm repo add gitlab https://charts.gitlab.io/
# sudo helm search repo gitlab
sudo helm repo update
sudo helm show values gitlab/gitlab > gitlab/values.yaml

sudo helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.hosts.domain=gitlab.fcatinau.com \
  --set certmanager-issuer.email=fcatinau@student.42.fr \
  --set global.ingress.configureCertmanager="false"\
  --set global.hosts.externalIP=127.0.0.1 \
  --set global.hosts.https="false"\
  --set gitlab-runner.install="false" -n gitlab

  # --set global.edition=ce \
  # --set certmanager-issuer.email=me@example.com \

# echo -n "Gitlab password: "

# sudo kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -o jsonpath='{.data.password}' | base64 -d; echo

echo "###################### Done ######################"
# echo "Wait for deployement of GitLab"
# sudo kubectl wait -n gitlab --for=condition=available deployment --all --timeout=-1s
