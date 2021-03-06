#!/bin/sh
# Script to control backlight brightness with light

NUM="${2:-10}"

BRI=$(light)

case "$1" in
    up) doas /usr/bin/light -A "$NUM"; pkill -RTMIN+8 dwmblocks ;;
    down) doas /usr/bin/light -U "$NUM"; pkill -RTMIN+8 dwmblocks ;;
    status) echo "$BRI%" ;;
    *) echo "Usage: light.sh [up|down|status] <value>" ;;
esac


doas /usr/bin/light -O
