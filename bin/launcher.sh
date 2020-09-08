#!/bin/sh
#setsid volund


exec j4-dmenu-desktop \
  --no-generic \
  --term=kitty \
  --usage-log=$HOME/.local/share/launcher-usage \
  --dmenu="bemenu.sh"
