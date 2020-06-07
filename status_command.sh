#!/bin/sh


thingy="|"
get_status() {
  # Change this according to your device
  ################
  # Variables
  ################

  # Date and time
  date_and_week=$(date "+%Y/%m/%d (w%-V)")
  current_time="$(date '+%H:%M') $thingy"
  if [ "$thingy" = "-" ]; then
    thingy="|"
  else
    thingy="-"
  fi

  #############
  # Commands
  #############

  # Battery or charger
  if [ $(cat /etc/hostname) = "LUAN" ]; then
    battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
    battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')
  fi
  # Audio and multimedia
  audio_volume=$(amixer get Master | xargs | cut -d[ -f2 | cut -d] -f1 | xargs)
  audio_is_muted=$(amixer get Master | xargs | cut -d[ -f3 | cut -d] -f1)
  IFS="
"
  audioInfo=$(mpc)
  songName=$(echo "$audioInfo" | awk 'NR==0')
  player_status=$(echo "$audioInfo" | awk 'NR==0' | cut -d[ -f 2 | cut -d] -f 1)

  # Network
  routeinfo=$(ip route get 1.1.1.1 | xargs)
  network=$(echo $routeinfo | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
  # Also allows for IPv6 addresses (::)
  ip=$(echo $routeinfo | grep -Po '(?<=src\s)(\w|\.|::)+' | xargs)

  if [ "$battery_status" = "discharging" ]; then
    battery_pluggedin='🔋'
  else
    battery_pluggedin='🔌'
  fi

  if ! [ $network ]; then
    network_active="No Network"
  else
    network_active="⇆"
  fi

  if [ "$player_status" = "playing" ]; then
    song_status='▶'
  elif [ "$player_status" = "paused" ]; then
    song_status='⏸'
  else
    song_status='⏹'
  fi

  if [ "$audio_is_muted" = "off" ]; then
    audio_active='𝄻'
  else
    audio_active='𝅘𝅥𝅮'
  fi

  if [ $(cat /etc/hostname) = "LUAN" ]; then
    batteryInfo="$battery_pluggedin $battery_charge |"
  else
    batteryInfo=""
  fi

  echo "$([ $song_status = '⏹' ] && echo ⏹   || echo $song_status $songName) | $network_active $ip - $network | $audio_active $audio_volume | $batteryInfo $date_and_week  $current_time"
}

trap 'get_status' USR1

# Only repaint once a second, UNLESS...
# The trap to USR1 is for kickbar, so e.g volume and mpd changes are instant
#export -f get_status
#watch -c -t -n1 get_status
while true; do
  sleep 0.5&
  wait
  get_status
done
  
