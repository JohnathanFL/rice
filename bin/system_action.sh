#!/bin/sh
# Show a bemenu of options for system management


options="Exit
Shutdown
Reboot
Suspend"

choice=$(echo "$options" | bemenu.sh)

case $choice in
  # TODO: Move this to an abstract thing for awesome or sway
  "Exit" )
    #exec swaymsg exit
    exec hyprctl dispatch exit
    ;;
  Shutdown )
    exec shutdown now
    ;;
  Reboot )
    exec reboot
    ;;
  Suspend )
    ~/bin/swaylock.sh &
    exec systemctl suspend
    ;;
  "")
    # bemenu was quit
    ;;
  *)
    echo "How'd we get here?"
    ;;
esac
