#!/bin/bash

MAX_CLOCK=10000
BAR_WIDTH=10

# Query memory clock instead of SM clock
clock=$(nvidia-smi --query-gpu=clocks.mem --format=csv,noheader,nounits | head -n1)

filled=$(( clock * BAR_WIDTH / MAX_CLOCK ))
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

printf "[%s] %4d" "$bar" "$clock"
