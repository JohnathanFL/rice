#!/bin/zsh

DESIRED=`cat $RICE/launcher.list | fzf`
CUTDESIRED=`echo $DESIRED | cut -d '[' -f 2 | cut -d ']' -f 1`

echo DESIRED IS $DESIRED
echo CUTDESIRED IS $CUTDESIRED

if $CUTDESIRED; then
	# Nothing for now
	echo
else
	echo $CUTDESIRED | xargs -r swaymsg -t command exec
fi
