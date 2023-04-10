#!/bin/sh
# bemenu wrapper with my personalized settings

# MONOKAI THEME
font="Victor mono 10"
titleBg=$DRACULA_RED
titleFg=$DRACULA_WHITE
filterBg="#282a36"
filterFg=$DRACULA_WHITE
normalBg='#282a36'
normalFg=$DRACULA_WHITE
highlightBg=$DRACULA_RED
highlightFg=$DRACULA_WHITE
selectedBg=$DRACULA_BLUE
selectedFg=$DRACULA_BLUE
scrollbarBg=$DRACULA_PURPLE
scrollbarFg=$DRACULA_WHITE

exec /usr/bin/bemenu -b \
  -m -1 \
  --list 10 \
  --ignorecase \
  --fn $font \
  --tb $titleBg \
  --tf $titleFg \
  --fb $filterBg \
  --ff $filterFg \
  --nb $normalBg \
  --nf $normalFg \
  --hb $highlightBg \
  --hf $highlightFg \
  --sb $selectedBg \
  --sf $selectedFg \
  --scb $scrollbarBg \
  --scf $scrollbarFg \
  -p '' \
  $@
