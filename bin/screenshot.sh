#!/bin/sh

# TODO: Make it autodetect X11 or Wayland

FILENAME=`date +'printscr_%F_%s.png'`
FILE="$HOME/Pictures/Screenshots/$FILENAME"
mkdir -p ~/Pictures/Screenshots

if [ "$1" != "now" ] && [ ! -z $(which slurp) ]; then
	grim -g "$(slurp)" "$FILE"
else
	grim "$FILE"
fi

cat "$FILE" | wl-copy --type image/png
