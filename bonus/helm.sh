#!/bin/bash

echo "###################### Install Gitlab ######################"
sudo kubectl create namespace gitlab
sudo helm repo add gitlab https://charts.gitlab.io/

sudo helm repo update

sudo helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.hosts.domain=gitlab.fcatinau.com \
  --set certmanager-issuer.email=fcatinau@student.42.fr \
  --set global.hosts.https=false\
  --set global.ingress.configureCertmanager=false\
  --set gitlab-runner.install="false" -n gitlab


sudo kubectl wait -n gitlab --for=condition=available deployment --all --timeout=-1s

echo -n "User : root Password : "
sudo kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -o jsonpath='{.data.password}' | base64 -d; echo
echo -n "User : admin Password : "
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

sudo kubectl port-forward --address 0.0.0.0 svc/gitlab-webservice-default -n gitlab 8085:8181 | sudo kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8080:443 

echo "###################### Done ######################"