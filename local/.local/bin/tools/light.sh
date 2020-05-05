#!/bin/bash
# Script to control backlight brightness with light

NUM="${2:-10}"

BRI=$(light)

case "$1" in
    up) sudo light -A "$NUM" && pkill -RTMIN+8 dwmblocks ;;
    down) sudo light -U "$NUM" && pkill -RTMIN+8 dwmblocks ;;
    *) echo "Usage: audio.sh [up|down] <value>" ;;
esac

doas /usr/bin/light -O
