#!/bin/bash

# Make all .sh files executable
chmod +x *.sh

# Run the following scripts in order with a delay to ensure completion

echo "Running setup-bspwm.sh..."
./setup-bspwm.sh
wait
sleep 10

echo "Running setup-sxhkd.sh..."
./setup-sxhkd.sh
wait
sleep 10

echo "Running setup-polybar.sh..."
./setup-polybar.sh
wait
sleep 10

echo "Running setup-dots.sh..."
./setup-dots.sh
wait
sleep 10

echo "Running setup-bluetooth.sh..."
./setup-bluetooth.sh
wait
sleep 10

echo "Running setup-fonts-n-icons.sh..."
./setup-fonts-n-icons.sh
wait
sleep 10

echo "Running setup-ranger.sh..."
./setup-ranger.sh
wait
sleep 10

echo "Running setup-apps.sh..."
./setup-apps.sh
wait
sleep 10

echo "Running setup-login-manager.sh..."
./setup-login-manager.sh
wait
sleep 10

echo "All setup scripts have been executed."
