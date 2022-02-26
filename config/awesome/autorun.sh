#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run cbatticon
run feh --bg-scale $RICE/wall --B \#2e3440

xrandr --output DVI-D-1 --primary --pos 0x0 --output HDMI-2  --right-of DVI-D-1
xinput set-prop "Logitech Gaming Mouse G502" "Coordinate Transformation Matrix" 2.4 0 0 0 2.4 0 0 0 1
xset r rate 150 50
