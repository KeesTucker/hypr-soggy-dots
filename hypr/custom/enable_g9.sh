#!/bin/bash

configuration_file="$HOME/.config/hypr/hyprland.conf"

# Uncomment standard mode monitors
sed -E -i 's/^#\s*(monitor = DP-1, 5120x1440@239\.76, 0x0, 1, bitdepth, [0-9]+, cm, srgb, vrr, [01])/\1/' "$configuration_file"
sed -E -i 's/^#\s*(monitor = HDMI-A-1, disabled)/\1/' "$configuration_file"

# Comment out Sunshine mode monitors
sed -E -i 's/^\s*(monitor = DP-1, disabled)/# \1/' "$configuration_file"
sed -E -i 's/^\s*(monitor = HDMI-A-1, 3840x2160@60, auto, 1, bitdepth, [0-9]+, cm, srgb)/# \1/' "$configuration_file"

echo "Switched to standard monitor configuration."

hyprctl reload
