#!/bin/bash

# Install LightDM and related packages
sudo apt-get -y install lightdm
sudo apt-get -y install lightdm-settings
sudo apt-get -y install lightdm-gtk-greeter
sudo apt-get -y install lightdm-gtk-greeter-settings
sudo apt-get -y install slick-greeter

# Set Slick Greeter as the default login screen
sudo bash -c 'echo "[Seat:*]
greeter-session=slick-greeter
user-session=default
" > /etc/lightdm/lightdm.conf'

# Show username on login screen
sudo bash -c 'echo "[Seat:*]
greeter-hide-users=false
" >> /etc/lightdm/lightdm.conf'

# Allow root login
sudo bash -c 'echo "[Seat:*]
greeter-allow-guest=true
" >> /etc/lightdm/lightdm.conf'

# Enable LightDM service
sudo systemctl enable lightdm.service

echo "LightDM has been installed and configured. Slick Greeter is set as the default, username is shown, and root login is allowed."
