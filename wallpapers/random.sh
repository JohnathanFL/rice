#!/bin/sh


setsid swaybg --mode fill \
  --image $(find $RICE/wallpapers/rotation | sort -R | tail -1)
