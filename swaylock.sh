#!/bin/sh

# Transparent
EMPTY=00000000
swaylock\
	--disable-caps-lock-text\
        --image $RICE/wall.png\
        --indicator-caps-lock\
        --indicator-radius 250\
        --indicator-thickness 30\
        --inside-caps-lock-color $EMPTY\
        --inside-color $EMPTY\
        --key-hl-color 0000FFFF\
        --line-caps-lock-color $EMPTY\
        --line-color $EMPTY\
        --line-ver-color $EMPTY\
        --line-wrong-color $EMPTY\
        --ring-caps-lock-color FFFFFFFF\
        --ring-color $EMPTY\
        --ring-ver-color $EMPTY\
        --ring-wrong-color $EMPTY\
        --separator-color $EMPTY\
	--text-clear-color $EMPTY\
        --text-ver-color $EMPTY\
        --text-wrong-color $EMPTY\
