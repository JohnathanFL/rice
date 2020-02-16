#!/bin/sh

PLACE="$RICE/wallpapers/rotation"
if ! [ -z "$1" ]; then
  PLACE="$1"
fi

find -L "$PLACE" -type f,l

setsid swaybg --mode fill \
  --image $(find -L "$PLACE" -type f,l | sort -R | tail -1) \
  --color $(cat $RICE/wallpapers/background)
