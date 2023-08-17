#!/bin/bash

echo "[INFO]  GO TO INSTALL k3s (ip: $1)"

echo "[INFO] config var k3s"
cd /etc/yum.repos.d/
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -

echo "[INFO]  Successfully installed k3s on server node"
echo "[INFO]  END"
sleep 10
/usr/local/bin/k3s kubectl get nodes
echo "[INFO]  END TEST"
sleep 10
/usr/local/bin/k3s kubectl get jobs -n kube-system 
/usr/local/bin/k3s kubectl -n kube-system wait --for=condition=complete --timeout=-1s jobs/helm-install-traefik-crd
/usr/local/bin/k3s kubectl -n kube-system wait --for=condition=complete --timeout=-1s jobs/helm-install-traefik
/usr/local/bin/k3s kubectl get jobs -n kube-system

echo "[INFO]  Doing some sleep to wait for k3s to be ready"
sleep 10

echo "[INFO]  STARTING APP DEPLOYMENT"
/usr/local/bin/k3s kubectl apply -f /vagrant/scripts/service.yml; sleep 2
echo "[INFO]  STARTING APP DEPLOYMENT"

/usr/local/bin/k3s kubectl apply -f /vagrant/scripts/app1.yml; sleep 2
echo "[INFO]  STARTING APP DEPLOYMENT"

/usr/local/bin/k3s kubectl apply -f /vagrant/scripts/app2.yml; sleep 2
echo "[INFO]  STARTING APP DEPLOYMENT"

/usr/local/bin/k3s kubectl apply -f /vagrant/scripts/app3.yml; sleep 2
echo "[INFO]  STARTING APP DEPLOYMENT"

/usr/local/bin/k3s kubectl apply -f /vagrant/scripts/ingress.yml; sleep 2
echo "[INFO]  END"

