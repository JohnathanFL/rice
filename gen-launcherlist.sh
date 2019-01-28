#!/bin/bash

IFS=$'\n'

echo > launcher.list

for FILE in `locate "*applications/*.desktop" | sort -u`; do
	CMD=`cat $FILE  | grep -E '^Exec=.+$' -m 1 | cut -d= -f2- | cut -d% -f1`
	NAME=`cat $FILE | grep -E '^Name=.+$' -m 1 | cut -d= -f2-`
	echo $NAME [$CMD]>> launcher.list.tmp
done

cat launcher.list.tmp | sort | uniq >> launcher.list
rm launcher.list.tmp
