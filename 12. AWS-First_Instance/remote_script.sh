#!/bin/bash
set -x

wait_for_apt() {
  echo "Waiting for other apt processes to finish..."
  while fuser /var/lib/apt/lists/lock >/dev/null 2>&1 || \
        fuser /var/lib/dpkg/lock >/dev/null 2>&1 || \
        fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
    sleep 1
  done
}

# Wait first before any apt operation
wait_for_apt && sudo apt update

wait_for_apt && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

wait_for_apt && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

wait_for_apt && sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

wait_for_apt && sudo apt update

wait_for_apt && sudo apt install -y docker-ce

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Check installations
docker --version
docker-compose --version

set +x

# Start Grafana container
sudo docker run -d --name=grafana -p 3000:3000 grafana/grafana
