#!/bin/bash

echo "###################### Creation Cluster ######################"
#  Create the cluster
k3d cluster create argocd

echo "###################### Creation Namespace ######################"
# Create both namespace
kubectl create namespace dev
kubectl create namespace argocd

echo "###################### Install ArgoCD ######################"
# Install argocd on pods
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.5/manifests/install.yaml

echo "###################### Deploy script ######################"
# Need to apply the script of deployement

# Boucle while to wait pod ready
while [[ $(kubectl get pods -n argocd -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}' 2> /dev/null) != "True True True True True True True" ]]; \
 do echo "Waiting all pods to be ready..." && sleep 10; done

echo "Done"

# k apply -f application.yaml

# https://github.com/Balgor18/viporten_IOT_P3.git # Project link