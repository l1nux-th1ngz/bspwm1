#!/bin/bash

echo "Installing Bluetooth services..."

# Install BlueZ and Blueman
sudo apt-get -y install bluez
sudo apt-get -y install blueman

echo "Bluetooth services installed."

# Enable Bluetooth service to start on boot
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

echo "Bluetooth services enabled and started."
