#!/bin/bash

config_file="$HOME/.config/hypr/hyprland.conf"

# Uncomment Standard mode monitors (lines 7-8)
sed -i '6s/^# *//;7s/^# *//' "$config_file"

# Comment out Sunshine mode monitors (lines 10-11)
sed -i '9s/^[^#]/# &/;10s/^[^#]/# &/' "$config_file"

echo "Switched to Standard monitor configuration."

hyprctl reload
