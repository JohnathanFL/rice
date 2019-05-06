#!/bin/sh

# TODO: Make it autodetect X11 or Wayland

FILENAME=`date +'printscr_%F_%s.png'`
mkdir -p ~/Pictures/Screenshots

[ ! -z $(which slurp) ] && \
	grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME \
||      grim ~/Pictures/Screenshots/$FILENAME

