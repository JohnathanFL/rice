#!/bin/sh
set -eu

# TODO: Make it autodetect X11 or Wayland

FILENAME=`date +'%Y/%m/%d/printscr_%s.png'`
FILE="$HOME/Pictures/Screenshots/$FILENAME"
mkdir -p "$(dirname "$FILE")"

if [ "${1:-}" != "now" ] && [ ! -z $(which slurp) ]; then
	grim -g "$(slurp)" "$FILE"
else
	grim "$FILE"
fi

cat "$FILE" | wl-copy --type image/png
