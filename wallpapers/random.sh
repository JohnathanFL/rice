#!/bin/sh


setsid swaybg --mode fill \
  --image $(find $RICE/wallpapers/rotation -type f,l | sort -R | tail -1)
