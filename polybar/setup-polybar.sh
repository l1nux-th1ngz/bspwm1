#!/usr/bin/env bash

# Install Polybar
sudo apt-get install -y polybar

# Create Polybar configuration directory
mkdir -p ~/.config/polybar

# Move the 'shapes' directory to the Polybar configuration directory
mv shapes ~/.config/polybar

# Change to the Polybar configuration directory
cd ~/.config/polybar

# Create the launch.sh script
cat << 'EOF' > launch.sh
dir="$HOME/.config/polybar"
#!/usr/bin/env bash

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch the bar with the shapes theme
    polybar -q main -c "$dir/shapes/config.ini" &   
}

# Launch the shapes theme
launch_bar

cat <<- EOF
    Usage : launch.sh
        
    This script is configured to launch only the "shapes" theme.
EOF
EOF

# Make the launch.sh script executable
chmod +x launch.sh

echo "Polybar setup script has been created and is executable."
