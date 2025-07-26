#!/bin/bash

BAR_WIDTH=10
MAX_WATTS=364

power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits | head -n1 | cut -d'.' -f1)

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
