#!/bin/zsh
# bemenu wrapper with my personalized settings

# MONOKAI THEME
font="Victor mono 10"
titleBg=$MONOKAI_RED
titleFg=$MONOKAI_WHITE
filterBg=$MONOKAI_BLACK
filterFg=$MONOKAI_WHITE
normalBg=$MONOKAI_BLACK
normalFg=$MONOKAI_WHITE
highlightBg=$MONOKAI_RED
highlightFg=$MONOKAI_WHITE
selectedBg=$MONOKAI_BLUE
selectedFg=$MONOKAI_BLUE
scrollbarBg=$MONOKAI_PURPLE
scrollbarFg=$MONOKAI_WHITE

bemenu -b \
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
