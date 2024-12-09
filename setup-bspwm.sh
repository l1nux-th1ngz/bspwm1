#!/bin/bash

# Install necessary packages
sudo apt-get -y install bspwm
sudo apt-get -y install nemo
sudo apt-get -y install xdg-user-dirs
sudo apt-get -y install xdg-user-dirs-gtk

# Update user directories
xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Install necessary packages
sudo apt-get -y install xorg 
sudo apt-get -y install xbindkeys
sudo apt-get -y install xvkbd
sudo apt-get -y install xinput
sudo apt-get -y install build-essential
sudo apt-get -y install intel-microcode 
sudo apt-get -y install xserver-xorg
sudo apt-get -y install xbacklight
sudo apt-get -y install xinit
sudo apt-get -y install policykit-1
sudo apt-get -y install policykit-1-gnome
sudo apt-get -y install zsh 

# Create the directories
mkdir -p ~/.config/bspwm/scripts
mkdir -p ~/.config/autostart
mkdir -p ~/Wallpapers
mkdir -p ~/Git
mkdir -p ~/.local/bin # add to path

# Create the bspwm_resize file
cd ~/.config/bspwm/scripts
touch bspwm_resize

# Check if .xinitrc exists, if not, create it
if [ ! -f ~/.xinitrc ]; then
    touch ~/.xinitrc
fi

# Add startup commands to .xinitrc
cat << 'EOF' >> ~/.xinitrc
/etc/X11/Xsession &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
xsetroot -cursor_name left_ptr & 
picom &  
nitrogen --restore &
~/.config/polybar/launch.sh &
exec bspwm
EOF

echo ".xinitrc has been updated with the required startup commands."

# Add the content to bspwm_resize
cat << 'EOF' > bspwm_resize
#!/usr/bin/env dash

if bspc query -N -n focused.floating > /dev/null; then
    step=20
else
    step=100
fi

case "$1" in
    west) dir=right; falldir=left; x="-$step"; y=0;;
    east) dir=right; falldir=left; x="$step"; y=0;;
    north) dir=top; falldir=bottom; x=0; y="-$step";;
    south) dir=top; falldir=bottom; x=0; y="$step";;
esac

bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
EOF

# Make the script executable
chmod +x bspwm_resize

echo "bspwm_resize script has been created and is executable."

# Create the bspwmrc file with content
cat << 'EOF' > ~/.config/bspwm/bspwmrc
#!/bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

wmname LG3D &
vmware-user-suid-wrapper &

bspc monitor -d I II III IV V VI VII VIII IX X

bspc config border_width 0
bspc config window_gap 10
bspc config split_ratio 0.50
bspc config borderless_monocle true
bspc config gapless_monocle true
bspc config paddingless_monocle true
bspc config focus_follows_pointer true
bspc config pointer_modifier mod1
bspc config normal_border_color '#1f1f1f'
bspc config focused_border_color '#30302f'
bspc config presel_feedback_color '#512da8'

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

feh --bg-fill ~/Wallpapers/random photo &
~/.config/polybar/launch.sh --shapes &
picom --config ~/.config/picom/picom.conf &
EOF

# Make the bspwmrc file executable
chmod +x ~/.config/bspwm/bspwmrc

echo "bspwm configuration script has been created and is executable."
