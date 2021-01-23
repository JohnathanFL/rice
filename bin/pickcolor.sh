#!/bin/sh
grim -g "$(slurp -p)" -t ppm - |
  convert - -format '%[pixel:p{0,0}]' txt:-|
  head -n2 |
  tail -n1 |
  sed -E 's/^.+(#\w\w\w\w\w\w).+$/\1/g' |
  wl-copy

wl-paste
