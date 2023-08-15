#!/bin/bash

set -x

#!/bin/bash

# Mise à jour des paquets
sudo apt-get update

# Installation des dépendances nécessaires
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Ajout de la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajout du référentiel Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des paquets à nouveau
sudo apt-get update

# Installation de Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Ajout de l'utilisateur courant au groupe Docker (pour exécuter des commandes Docker sans sudo)
sudo usermod -aG docker $USER

# Redémarrage du service Docker
sudo systemctl restart docker





# sudo apt-get update 1> /dev/null
# sudo apt install apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# apt-cache policy docker-ce

# sudo apt install docker-ce
# sudo apt-get install ca-certificates curl gnupg 1> /dev/null

# sudo install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# sudo chmod a+r /etc/apt/keyrings/docker.gpg

# echo \
#   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo apt-get update

# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
