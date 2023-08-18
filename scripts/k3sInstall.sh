

# export variable d'environnement necessaire a k3s
echo "[INFO] Install K3s"

echo "[INFO] Export INSTALL_K3S_EXEC"

export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1 --bind-address=$1 --advertise-address=$1"
echo "[INFO] ARG PASS TO INSTALL_K3S_EXEC = $INSTALL_K3S_EXEC"

echo "[INFO] Install curl"
apk add curl

echo "[INFO] Install k3s"
curl -sfL https://get.k3s.io | sh - 

echo "[INFO] Install succed k3s"

sleep 10
kubectl apply -f /vagrant/scripts/traefik.yaml; sleep 2
kubectl apply -f /vagrant/scripts/app1.yaml; sleep 2
kubectl apply -f /vagrant/scripts/app2.yaml; sleep 2
kubectl apply -f /vagrant/scripts/app3.yaml; sleep 2
kubectl apply -f /vagrant/scripts/hostname.yaml; sleep 2


#installer for k3s
    # intsller curl
    