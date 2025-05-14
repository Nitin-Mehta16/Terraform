#!/bin/bash
apt-get update -y
apt-get install nginx -y
echo "Hello, World!" > /var/www/html/index.html
systemctl start nginx
systemctl enable nginx