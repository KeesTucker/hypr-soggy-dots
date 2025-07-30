#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"
TARGET="$1"

# Validate argument
if [[ "$TARGET" != "0" && "$TARGET" != "1" ]]; then
  echo "Usage: $0 [0|1]"
  exit 1
fi

# Replace vrr value for DP-1
sed -i "s/^\(monitor = DP-1, 5120x1440@239\.76, 0x0, 1, bitdepth, 8, cm, srgb, vrr, \)[01]$/\1$TARGET/" "$CONFIG"

echo "Set vrr to $TARGET in hyprland.conf"

