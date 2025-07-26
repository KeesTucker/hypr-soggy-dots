#!/bin/bash

MAX_FREQ=5150  # Max MHz for scaling bar graph
BLOCKS=( ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ )

# Get per-core Avg_MHz with turbostat
mapfile -t freqs < <(sudo turbostat --quiet --show Avg_MHz --num_iterations 1 --interval 1 | tail -n +2)

bars=""
max=0
for f in "${freqs[@]}"; do
  # Calculate bar level
  level=$(( f * 8 / MAX_FREQ ))
  (( level > 7 )) && level=7
  bars+=${BLOCKS[$level]}

  # Track max freq
  (( f > max )) && max=$f
done

printf "%s %4dMHz\n" "$bars" "$max"
