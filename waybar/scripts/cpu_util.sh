#!/bin/bash

BAR_WIDTH=10
STATE_FILE="/tmp/.cpu_stat_prev"

read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
curr_idle=$((idle + iowait))
curr_non_idle=$((user + nice + system + irq + softirq + steal))
curr_total=$((curr_idle + curr_non_idle))

if [[ -f "$STATE_FILE" ]]; then
  read prev_total prev_idle < "$STATE_FILE"
else
  # First run: store current state and exit with 0 usage
  echo "$curr_total $curr_idle" > "$STATE_FILE"
  usage=0
  filled=0
  bar=$(printf '░%.0s' $(seq 1 $BAR_WIDTH))
  printf "[%s] %3d\n" "$bar" "$usage"
  exit 0
fi

# Store for next run
echo "$curr_total $curr_idle" > "$STATE_FILE"

# Calculate deltas
totald=$((curr_total - prev_total))
idled=$((curr_idle - prev_idle))

# Avoid division by zero
if (( totald == 0 )); then
  usage=0
else
  usage=$(( (100 * (totald - idled)) / totald ))
fi

# Clamp and scale
filled=$(( usage * BAR_WIDTH / 100 ))
(( filled < 0 )) && filled=0
(( filled > BAR_WIDTH )) && filled=$BAR_WIDTH

# Build the bar
bar=""
for ((i=0; i < BAR_WIDTH; i++)); do
  if (( i < filled )); then
    bar+="█"
  else
    bar+="░"
  fi
done

printf "[%s] %3d\n" "$bar" "$usage"
