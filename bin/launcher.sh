#!/bin/sh
#setsid volund

# Really dumb bug: j4 relies on executing the shell for *everything*. Thus,
# a non-compliant shell like fish will break it.
export SHELL=/bin/sh

exec j4-dmenu-desktop \
  --no-generic \
  --term=kitty \
  --usage-log=$HOME/.local/share/launcher-usage \
  --dmenu="bemenu.sh"\
  $@
