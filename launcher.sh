#!/bin/sh
#setsid volund

bemenuOptions="-b \
--list 10 \
--ignorecase \
--nb \#3b4252 \
--hb \#5e81ac \
--hf \#d8dee9 \
--fb \#434c5e \
--ff \#d8dee9 \
-p '' \
--fn 'VictorMono 10'
"
j4-dmenu-desktop --dmenu="bemenu $bemenuOptions"
