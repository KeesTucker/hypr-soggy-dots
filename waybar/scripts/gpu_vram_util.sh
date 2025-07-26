#!/bin/bash

BAR_WIDTH=10

# Get used and total memory (MiB) and strip commas
read -r used total <<< $(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits | head -n1 | tr -d ',')

percent=$(( used * 100 / total ))
filled=$(( percent * BAR_WIDTH / 100 ))

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

printf "[%s] %5d" "$bar" "$used"
