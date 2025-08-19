#!/bin/bash

# Add the official Docker repository
sudo dnf -y install dnf-plugins-core
sudo wget https://download.docker.com/linux/fedora/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo

# Install Docker Engine
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
sudo systemctl enable --now docker.service

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Add host.docker.internal to /etc/hosts for container->host communication
if ! grep -q "host.docker.internal" /etc/hosts; then
  echo "172.17.0.1    host.docker.internal" | sudo tee -a /etc/hosts
fi

# Prevent Docker from preventing boot for network-online.target
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
[Unit]
DefaultDependencies=no
EOF

sudo systemctl daemon-reload