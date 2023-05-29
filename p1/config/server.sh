
print "Install curl"
sudo apk add curl

export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1"

curl -sfL https://get.k3s.io |  sh -