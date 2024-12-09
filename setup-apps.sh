#!/bin/bash

# Install applications
sudo apt-get -y install kitty
sudo apt-get -y install alacritty
sudo apt-get -y install picom
sudo apt-get -y install geany
sudo apt-get -y install geany-plugins
sudo apt-get -y install mpv
sudo apt-get -y install ncmpcpp
sudo apt-get -y install parcellite
sudo apt-get -y install qt5ct
sudo apt-get -y install dunst
sudo apt-get -y install rofi

# Create the .config directory if it doesn't exist
mkdir -p ~/.config

# Move application configuration folders to .config
echo "Moving directories to ~/.config/"
mv kitty ~/.config/
mv alacritty ~/.config/
mv picom ~/.config/
mv geany ~/.config/
mv mpv ~/.config/
mv ncmpcpp ~/.config/
mv parcellite ~/.config/
mv dunst ~/.config/
mv rofi ~/.config/

echo "Moved $dir to ~/.config/"

echo "All applications have been installed and their configuration folders have been moved to ~/.config."
