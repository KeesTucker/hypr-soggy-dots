#!/bin/bash

configuration_file="$HOME/.config/hypr/hyprland.conf"
vrr_value="$1"

# Validate argument
if [[ "$vrr_value" != "0" && "$vrr_value" != "1" ]]; then
  echo "Usage: $0 [0|1]"
  exit 1
fi

# Replace vrr value for DP-1
sed -E -i "s/^(monitor = DP-1, 5120x1440@239\.76, 0x0, 1, bitdepth, [0-9]+, cm, srgb, vrr, )[01]/\1$vrr_value/" "$configuration_file"

echo "Set vrr to $vrr_value in hyprland.conf"
