#!/bin/bash

echo "###################### Install Docker ######################"


snap install docker
snap install kubectl --classic

echo "###################### Install K3d ######################"
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh