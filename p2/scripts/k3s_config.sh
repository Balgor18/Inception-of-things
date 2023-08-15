#!/bin/bash

echo "[INFO]  GO TO INSTALL k3s (ip: $1)"

echo "[INFO] config var k3s"
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1 "
echo "[INFO]  ARGUMENT PASSED TO INSTALL_K3S_EXEC: $INSTALL_K3S_EXEC"

echo "[INFO] add dep"
apk add curl

echo "[INFO] dep install - go install k3s"
curl -sfL https://get.k3s.io |  sh -
echo "[INFO]  Successfully installed k3s on server node"

echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh # way to add alias on all users

echo "[INFO]  Doing some sleep to wait for k3s to be ready"
sleep 10

kubectl apply -f /vagrant/scripts/services.yml; sleep 2

kubectl apply -f /vagrant/scripts/app1.yml; sleep 2

kubectl apply -f /vagrant/scripts/app2.yml; sleep 2

kubectl apply -f /vagrant/scripts/app3.yml; sleep 2

kubectl apply -f /vagrant/scripts/ingress.yml; sleep 2