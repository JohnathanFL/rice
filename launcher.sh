#!/bin/sh

CHOSEN=`ls $RICE/execs/ | bemenu -b -l 10 -p ">>>" -i -P "Run: "`
cat "$RICE/execs/$CHOSEN" | xargs -r swaymsg -t command exec
