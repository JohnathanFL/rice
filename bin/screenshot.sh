#!/bin/sh

# TODO: Make it autodetect X11 or Wayland

FILENAME=`date +'printscr_%F_%s.png'`
mkdir -p ~/Pictures/Screenshots

if [ ! -z $(which slurp) ]; then
	grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME
else
	grim ~/Pictures/Screenshots/$FILENAME
fi

