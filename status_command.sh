#!/bin/bash


# Change this according to your device
################
# Variables
################

# Date and time
date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M:%S")

#############
# Commands
#############

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

# Audio and multimedia
audio_volume=$(amixer get Master | xargs | cut -d[ -f2 | cut -d] -f1 | xargs)
audio_is_muted=$(amixer get Master | xargs | cut -d[ -f3 | cut -d] -f1)
IFS="
"
audioInfo=($(mpc))
songName=${audioInfo[0]}
player_status=$(echo ${audioInfo[1]} | cut -d[ -f 2 | cut -d] -f 1)

# Network
routeinfo=$(ip route get 1.1.1.1 | xargs)
network=$(echo $routeinfo | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# Also allows for IPv6 addresses (::)
ip=$(echo $routeinfo | grep -Po '(?<=src\s)(\w|\.|::)+' | xargs)

if [[ $battery_status = "discharging" ]];
then
    battery_pluggedin='🔋'
else
    battery_pluggedin='🔌'
fi

if ! [ $network ]
then
   network_active="⛔"
else
   network_active="⇆"
fi

if [[ $player_status = "playing" ]]
then
    song_status='▶'
elif [[ $player_status = "paused" ]]
then
    song_status='⏸'
else
    song_status='⏹'
fi

if [[ $audio_is_muted = "off" ]]
then
    audio_active='𝄻'
else
    audio_active='𝅘𝅥𝅮'
fi

echo "$( [[ $song_status = '⏹' ]] && echo ⏹ || echo $song_status $songName) | $network_active $ip - $network | $audio_active $audio_volume | $battery_pluggedin $battery_charge | $date_and_week  $current_time"
