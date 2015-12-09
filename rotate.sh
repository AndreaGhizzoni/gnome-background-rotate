#!/bin/bash
 
#walls_dir=$HOME/Pictures/wallpapers
#selection=$(find $walls_dir -type f -name "*.jpg" -o -name "*.png" | shuf -n1)
#gsettings set org.gnome.desktop.background picture-uri "file://$selection"

# Wallpaper's directory.
dir="${HOME}/Pictures/wallpapers/"

# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Random wallpaper.
wallpaper=`find "${dir}" -type f | shuf -n1`

# Change wallpaper.
# http://bit.ly/HYEU9H
gsettings set org.gnome.desktop.background picture-options "centered"
gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper}"

