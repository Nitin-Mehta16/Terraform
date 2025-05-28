#!/bin/bash

# Fix line endings for this script itself
sed -i 's/\r$//' "$0" 2>/dev/null || true

echo "Script is running..."
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx 
sudo chown ubuntu:ubuntu /var/www/html/