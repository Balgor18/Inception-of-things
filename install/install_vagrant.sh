#!/bin/bash

echo "###################### Install Virtual Box ######################"

apt update 2>&1 > /dev/null
apt install virtualbox -y 2>&1 > /dev/null
apt install virtualbox—ext–pack -y 2>&1 > /dev/null

echo "###################### Install Vagrant ######################"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

apt install vagrant -y 2>&1 > /dev/null

echo "###################### Install Done ######################"