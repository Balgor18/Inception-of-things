export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1 "

apk add curl 
curl -sfL https://get.k3s.io |  sh - # Litteraly from the documentation

sleep 10 # Wait and of installation

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/.

echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh # way to add alias on all users