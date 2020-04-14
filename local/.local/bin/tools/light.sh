#!/bin/bash
# Script to control backlight brightness with light

NUM="${2:-10}"

BRI=$(light)

case "$1" in
    up) doas /usr/bin/light -A "$NUM" && pkill -RTMIN+8 dwmblocks ;;
    down) doas /usr/bin/light -U "$NUM" && pkill -RTMIN+8 dwmblocks ;;
    *) echo "Usage: audio.sh [up|down] <value>" ;;
esac

doas /usr/bin/light -O
