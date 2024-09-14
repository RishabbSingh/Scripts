#!/bin/bash

# Update package list
sudo apt update

# Install Node.js and npm
sudo apt install -y nodejs npm

# Install Yarn globally using npm
sudo npm install -g yarn

# Install required dependencies for Grafana
sudo apt-get install -y apt-transport-https software-properties-common wget

# Create keyrings directory for Grafana
sudo mkdir -p /etc/apt/keyrings/

# Add Grafana GPG key and repository
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Update package list after adding Grafana repo
sudo apt-get update

# Install Grafana
sudo apt-get install -y grafana

# Reload systemd and start Grafana service
sudo systemctl daemon-reload
sudo systemctl start grafana-server

# Enable Grafana to start at boot
sudo systemctl enable grafana-server

# Check Grafana server status
sudo systemctl status grafana-server
