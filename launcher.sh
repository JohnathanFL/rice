#!/bin/zsh

print -rl -- ${(k)commands} \
	| sort \
	| bemenu -b -l 10 -p ">>>" -i -P "Run: " \
	| xargs -r swaymsg -t command exec
