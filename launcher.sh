#!/bin/sh
export BEMENU_BACKEND=wayland
CHOSEN=`ls $RICE/execs/ | bemenu -b -l 10 -p ">>>" -i -P "Run: "`
setsid `cat "$RICE/execs/$CHOSEN"`&
exit
