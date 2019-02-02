#!/bin/sh

# TODO: Make it autodetect X11 or Wayland

FILENAME=`date +'printscr_%F_%s.png'`
mkdir -p ~/Pictures/Screenshots
grim ~/Pictures/Screenshots/$FILENAME

