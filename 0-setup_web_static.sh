#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static

sudo apt-get -y update
sudo apt-get install -y nginx

# Create all necessary directories and file
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html
sudo echo "Hello World again!" > /data/web_static/releases/test/index.html

# Check if directory current exist
if [ -d "/data/web_static/current" ]
then
        sudo rm -rf /data/web_static/current
fi
# Create a symbolic link to test
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Change ownership to user ubuntu
sudo chown -hR "$USER":"$USER" /data

# Configure nginx to serve content pointed to by symbolic link to hbnb_static
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default

# Restart server
sudo service nginx restart