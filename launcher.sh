#!/bin/bash

exec `\
	cat $RICE/launcher.list |\
	dmenu -dim 0.75 |\
	cut -d '[' -f 2 |\
	cut -d ']' -f 1\
`
