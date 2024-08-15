#!/bin/bash
set -e

echo "Downloading- and installing script- and service ..."

wget https://raw.githubusercontent.com/AlvinNorin/keep-buff-cache-cleared/main/clear_cache.sh -P /tmp/
wget https://raw.githubusercontent.com/AlvinNorin/keep-buff-cache-cleared/main/clear_cache.service -P /tmp/

sudo mv /tmp/clear_cache.sh /usr/local/bin/clear_cache.sh
sudo mv /tmp/clear_cache.service /etc/systemd/system/clear_cache.service

sudo chmod +x /usr/local/bin/clear_cache.sh

echo "Enabling- and starting service ..."

sudo systemctl enable clear_cache.service
sudo systemctl start clear_cache.service

echo "Installation successful!"
