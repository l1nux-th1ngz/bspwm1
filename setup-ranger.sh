#!/bin/bash

# Install ranger
sudo apt-get install -y ranger

# Create the ranger config directory if it doesn't exist
if [ ! -d "$HOME/.config/ranger" ]; then
    mkdir -p "$HOME/.config/ranger"
fi

# Clone the ranger_devicons plugin
if [ ! -d "$HOME/.config/ranger/plugins/ranger_devicons" ]; then
    git clone https://github.com/alexanderjeurissen/ranger_devicons "$HOME/.config/ranger/plugins/ranger_devicons"
fi

# Add the default line mode configuration to ranger
if ! grep -q "default_linemode devicons" "$HOME/.config/ranger/rc.conf"; then
    echo "default_linemode devicons" >> "$HOME/.config/ranger/rc.conf"
fi

echo "Setup completed successfully."
exit 0
