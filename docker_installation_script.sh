#!/bin/bash

#  Update your existing list of packages
sudo apt update -y

# Install a few prerequisite packages which let apt use packages over HTTPS:

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add the GPG key for the official Docker repository to your system:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources:

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

# Install from the Docker repo instead of the default Ubuntu repo

apt-cache policy docker-ce

# Install Docker:

sudo apt install -y docker-ce 

# Check that Docker running:

sudo systemctl status docker &

# Add your username to the docker group:

sudo usermod -aG docker ${USER}

# Set the permissions to make Docker executable

sudo chmod +x /usr/local/bin/docker

# Verify the installation by checking the version

sudo docker --version

# Reboot

sudo reboot
