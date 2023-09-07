#!/bin/bash

echo "###################### Install Docker ######################"

snap install docker 2>&1 > /dev/null
snap install kubectl --classic 2>&1 > /dev/null

echo "###################### Install K3d ######################"

wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh # Check if really need

echo "###################### Install Done ######################"

echo "###################### Add dockerGroup ######################"
groupadd docker
usermod -aG docker vagrant

echo "###################### Done ######################"