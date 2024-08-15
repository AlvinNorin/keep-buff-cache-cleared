#!/bin/bash
set -e

echo "Stopping- and disabling service ..."
sudo systemctl disable clear_cache.service
sudo systemctl stop clear_cache.service

echo "Removing script- and service ..."
sudo rm /usr/local/bin/clear_cache.sh
sudo rm /etc/systemd/system/clear_cache.service

echo "Uninstallation successful!"
