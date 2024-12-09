#!/usr/bin/env bash
sudo apt-get install -y polybar
mkdir .config/polybar
mkdir .config/polybar/shapes
cd .config/polybar
touch launch.sh
# Add to launch.sh
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

# cd polybar
mv shapes .config/polybar
