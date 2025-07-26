#!/bin/bash

# Run hyprpicker and capture the colour
colour=$(hyprpicker)

# Check if output is not empty
if [[ -n "$colour" ]]; then
    # Remove any leading prompt text or whitespace
    colour=$(echo "$colour" | grep -oE '#[A-Fa-f0-9]{6}')

    # Copy to clipboard (for wlroots-based compositors like Hyprland)
    echo -n "$colour" | wl-copy

    # Optional: also print to terminal or notify
    notify-send "Colour picked" "$colour"
fi
