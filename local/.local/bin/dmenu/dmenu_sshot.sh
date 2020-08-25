#!/bin/bash
# Dmenu script to capture, save, and copy desktop screenshots
# Requires: maim, xclip, xdotool
set -xv
IMG_PATH=/home/four/Pictures/Screenshots
TIME=3000   # Milliseconds notification should remain visible

cd $IMG_PATH
case "$(printf -- "---Capture and Save---\\n1. Selected area\\n2. Current window\\n3. Fullscreen\\n---Capture Copy---\\na. Selected area (copy)\\nb. Current window (copy)\\nc. Fullscreen (copy)" | dmenu -l 8 -i -p 'Choose Screenshot Type:')" in
	'1. Selected area') maim -s screenshot-"$(date '+%y%m%d-%H%M-%S').png" && notify-send -u low -t $TIME 'Screenshot Captured' 'Captured screenshot of selected region'  ;;
	'2. Current window') sleep 1 && maim -i "$(xdotool getactivewindow)" screenshot-"$(date '+%y%m%d-%H%M-%S').png" && notify-send -u low -t $TIME 'Screenshot Captured' 'Captured screenshot of current window'   ;;
	'3. Fullscreen') sleep 1 && maim screenshot-"$(date '+%y%m%d-%H%M-%S').png" && notify-send -u low -t $TIME 'Screenshot Captured' 'Captured screenshot of fullscreen' ;;
	'a. Selected area (copy)') maim -s | xclip -selection clipboard -t image/png && notify-send -u low -t $TIME 'Screenshot Copied' 'Copied screenshot of selected region'    ;;
	'b. Current window (copy)') sleep 1 && maim -i "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png && notify-send -u low -t $TIME 'Screenshot Copied' 'Copied screenshot of current window'   ;;
	'c. Fullscreen (copy)') sleep 1 && maim | xclip -selection clipboard -t image/png && notify-send -u low -t $TIME 'Screenshot Copied' 'Copied screenshot of full screen'  ;;
esac
