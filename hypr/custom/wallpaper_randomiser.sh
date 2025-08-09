#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers/antireal"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

#WALLPAPER="$HOME/.config/hypr/wallpapers/antireal/extended_tumblr_pbog4otqO11wr7kcqo1_1280.png"

# Apply the selected wallpaper
# Set wallpaper with hyprpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

# Pick colors with wallust
wallust run "$WALLPAPER" -w
#wallust theme Synthwave

# Restart apps to apply themes
killall waybar && waybar &
kvantummanager --set soggy-wallust

# Update gtk theme
# Force replace all the white colours with foreground colour, as the catppuccin themer
# I hijacked doesn't change text colour and I'm lazy
~/.config/wallust/templates/soggy-gtk/force-text-color-colloid.sh
cd ~/.config/wallust/templates/soggy-gtk
# Run the hijacked themer to theme colloid with my colours
python install.py
# Reload notification daemon
makoctl reload
