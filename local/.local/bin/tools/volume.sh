#!/bin/sh
# Script to handle pulseaudio volume control

NUM="${2:-5}"

get_vol() { 
    vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')" 
    isMuted="$(pactl list sinks | grep 'Mute' | head -n 1 | cut -d ' ' -f2)" 
    [ $isMuted = 'yes' ] && echo "0" || echo "$vol" 
}

case "$1" in
    toggle) pactl set-sink-mute 0 toggle; pkill -RTMIN+9 dwmblocks ;;
    up) pactl set-sink-volume 0 +"$NUM"%; pkill -RTMIN+9 dwmblocks;;
    down) pactl set-sink-volume 0 -"$NUM"%; pkill -RTMIN+9 dwmblocks;;
    status) get_vol ;;
esac


