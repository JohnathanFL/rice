#!/bin/zsh

print -rl -- ${(k)commands} | sort | fzf | xargs -r swaymsg -t command exec
