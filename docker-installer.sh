#!/usr/bin/env bash

echo "[Pre-installation Docker]"

echo " 1. Uninstall the unofficial packages"
UNOFFICIAL_PACKAGES=(
  docker.io
  docker-doc
  docker-compose
  docker-compose-v2
  podman-docker
  containerd
  runc
)
for pkg in $UNOFFICIAL_PACKAGES; do
  sudo apt-get remove $pkg
  echo "    | remove $pkg"
done

echo "   | purge the packages"
sudo apt-get purge \
              docker-ce \
              containerd.io \
              docker-ce-cli \
              docker-buildx-plugin \
              docker-compose-plugin \
              docker-ce-rootless-extras;

echo "   | delete all images, containers, and volumes"
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd


echo "[Installation Docker]"

echo " 1. Set up Docker's apt repository"
sudo apt-get update
sudo apt-get install ca-certificates

echo "    | Add Docker's official GPG key"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "    | Add the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "    | refresh repositories"
sudo apt-get update

echo " 2. Install the Docker packages"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo " 3. Verify that the Docker Engine installation is successful by running the hello-world image"
sudo docker run hello-world

echo "    You have now successfully installed and started Docker Engine"


echo "[Post-installation Docker]"

echo " 1. Create the docker group"
sudo groupadd docker

echo " 2. Add your user to the docker group"
sudo usermod -aG docker $USER

echo " 3. Log out and log back in so that your group membership is re-evaluated"
echo " run below steps manually: \
        \$ newgrp docker \
        \$ docker run hello-world
        \$ sudo chown \"\$USER\":\"\$USER\" /home/\"\$USER\"/.docker -R
        \$ sudo chmod g+rwx \"\$HOME/.docker\" -R"
