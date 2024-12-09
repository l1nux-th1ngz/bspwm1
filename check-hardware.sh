#!/bin/bash

# Update the package list
sudo apt-get update

# Install necessary tools if not already installed
sudo apt-get -y install lshw pciutils usbutils

# Get hardware information
echo "Gathering hardware information..."

# List hardware details
HARDWARE_INFO=$(lshw -short)
echo "$HARDWARE_INFO"

# Function to install packages if not already installed
install_package() {
  if ! dpkg -l | grep -qw "$1"; then
    echo "Installing $1..."
    sudo apt-get install -y "$1"
  else
    echo "$1 is already installed."
  fi
}

# Check and install packages for common hardware components

# Graphics
if echo "$HARDWARE_INFO" | grep -iq "VGA"; then
  if echo "$HARDWARE_INFO" | grep -iq "NVIDIA"; then
    install_package "nvidia-driver"
    install_package "nvidia-settings"
    install_package "xserver-xorg-video-all"
    install_package "firmware-linux-nonfree"
  else
    install_package "xserver-xorg-video-all"
    install_package "firmware-linux-nonfree"
  fi
fi

# Network
if echo "$HARDWARE_INFO" | grep -iq "network"; then
  install_package "network-manager"
  install_package "wireless-tools"
  install_package "firmware-iwlwifi"
fi

# Audio
if echo "$HARDWARE_INFO" | grep -iq "audio"; then
  install_package "alsa-utils"
  install_package "pulseaudio"
fi

# USB
if echo "$HARDWARE_INFO" | grep -iq "usb"; then
  install_package "usbutils"
  install_package "usb-modeswitch"
fi

# CPU microcode (Intel and AMD)
if grep -q "Intel" /proc/cpuinfo; then
  install_package "intel-microcode"
elif grep -q "AMD" /proc/cpuinfo; then
  install_package "amd64-microcode"
fi

echo "Hardware enhancement complete."
