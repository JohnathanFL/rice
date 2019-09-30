#!/bin/sh
#setsid volund

pkill j4-dmenu-desktop
rm /tmp/j4-waiter
j4-dmenu-desktop --wait-on=/tmp/j4-waiter --dmenu="bemenu -b --list 10 --ignorecase --nb \#3b4252 --hb \#5e81ac --hf \#d8dee9 --fb \#434c5e --ff \#d8dee9 -p ''"
