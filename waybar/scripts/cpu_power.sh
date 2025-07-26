#!/bin/bash

BAR_WIDTH=10
MAX_WATTS=180

# Find zenpower hwmon path
hwmon_path=$(grep -l "zenpower" /sys/class/hwmon/hwmon*/name | sed 's|/name||')

# Read power in µW, convert to W
power_raw=$(cat "$hwmon_path/power1_input")
power=$(( power_raw / 1000000 ))  # µW to W

# Create bar
filled=$(( power * BAR_WIDTH / MAX_WATTS ))
(( filled < 0 )) && filled=0
(( filled > BAR_WIDTH )) && filled=$BAR_WIDTH

bar=""
for ((i=0; i < BAR_WIDTH; i++)); do
  if (( i < filled )); then
    bar+="█"
  else
    bar+="░"
  fi
done

printf "[%s] %3d" "$bar" "$power"
