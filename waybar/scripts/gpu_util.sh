#!/bin/bash

BAR_WIDTH=10

util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -n1)

filled=$(( util * BAR_WIDTH / 100 ))
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

printf "[%s] %3d" "$bar" "$util"
