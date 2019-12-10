#!/bin/sh
# Wayland wallpaper setter

pkill swaybg


if ! [ -z "$1" ]; then
  rm "$RICE/wall"
  ln -s "$1" "$RICE/wall"
fi

if [ -d "$RICE/wall" ]; then
  "$RICE/wallpapers/random.sh" "$RICE/wall" &
else
  swaybg --image "$RICE/wall" --mode fill &
fi

