#!/bin/sh
# bemenu wrapper with my personalized settings


bemenu -b \
  --list 10 \
  --ignorecase \
  --nb \#3b4252 \
  --hb \#5e81ac \
  --hf \#d8dee9 \
  --fb \#434c5e \
  --ff \#d8dee9 \
  --tb \#3b4252 \
  --tf \#d8dee9 \
  -p '' \
  --fn 'VictorMono 10' \
  $@
