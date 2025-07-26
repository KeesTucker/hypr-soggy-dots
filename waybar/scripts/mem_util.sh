#!/bin/bash

BAR_WIDTH=10

# Get used and total memory in kB
read used_k total_k <<< $(free -k | awk '/^Mem:/ {print $3, $2}')

# Convert used to MiB
used=$(( used_k / 1024 ))

# Calculate percentage usage
percent=$(( used_k * 100 / total_k ))

# Bar fill count
filled=$(( percent * BAR_WIDTH / 100 ))

(( filled < 0 )) && filled=0
(( filled > BAR_WIDTH )) && filled=$BAR_WIDTH

# Build bar string
bar=""
for ((i=0; i < BAR_WIDTH; i++)); do
  if (( i < filled )); then
    bar+="█"
  else
    bar+="░"
  fi
done

printf "[%s] %5d" "$bar" "$used"
