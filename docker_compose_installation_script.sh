#!/bin/bash

# Update the system's package index
sudo apt update -y

# Install required dependencies for Docker Compose installation
sudo apt install -y curl jq

# Download the current stable version of Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)

# Fetch and install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set the permissions to make Docker Compose executable
sudo chmod +x /usr/local/bin/docker-compose

# Verify the installation by checking the version
docker-compose --version

# Note: You may need to run `docker-compose` as root or add your user to the `docker` group
# Add the current user to the Docker group to allow running Docker without sudo
sudo usermod -aG docker ${USER}

# Reboot system to apply the group changes (optional but recommended)
echo "Docker Compose has been installed successfully. Rebooting the system in 5 seconds..."
sleep 5
sudo reboot

