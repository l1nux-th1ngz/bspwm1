#!/usr/bin/env bash

dir="$HOME/.config/polybar"

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch the bar with the shapes theme
    polybar -q main -c "$dir/shapes/config.ini" &   
}

# Only launch the shapes theme
launch_bar

cat <<- EOF
    Usage : launch.sh
        
    This script is configured to launch only the "shapes" theme.
EOF
