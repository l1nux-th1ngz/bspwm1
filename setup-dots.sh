#!/bin/bash

# Clone the repository
git clone https://github.com/gh0stzk/dotfiles.git

# Navigate to the bspwm directory
cd dotfiles/bspwm

# Create the bspwm configuration directory if it doesn't exist
mkdir -p ~/.config/bspwm

# Move the specified folders to the bspwm configuration directory
mv rices ~/.config/bspwm/
mv eww ~/.config/bspwm/
mv src ~/.config/bspwm/
mv .rice ~/.config/bspwm/

echo "Done"
