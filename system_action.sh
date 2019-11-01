#!/bin/sh
# Show a bemenu of options for system management


options="Exit Sway
Shutdown
Reboot
Suspend
"

choice=$(echo "$options" | $RICE/bemenu.sh)

case $choice in
  # TODO: Move this to an abstract thing for awesome or sway
  "Exit Sway")
    #echo "Exiting sway"
    swaymsg exit
    ;;
  Shutdown)
    #echo "Shutting down"
    shutdown now
    ;;
  Reboot)
    #echo "Rebooting"
    reboot
    ;;
  Suspend)
    #echo "Suspending"
    systemctl suspend
    ;;
  "")
    # bemenu was quit
    ;;
  *)
    echo "How'd we get here?"
    ;;
esac
