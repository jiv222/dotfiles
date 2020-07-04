#!/usr/bin/bash
# Script to handle desktop screenshots using scrot utility and dmenu

IMG_PATH=/home/four/Pictures/Screenshots
TIME=3000 #Miliseconds notification should remain visible

prog="---Local screenshots (saved at IMG_PATH)---
1.quick_fullscreen
2.delayed_fullscreen
3.section
"

cmd=$(dmenu -l 4 -p 'Choose Screenshot Type' <<< "$prog")

cd $IMG_PATH
case ${cmd%% *} in

	1.quick_fullscreen) scrot -d 1 '%F_%H%M%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Fullscreen screenshot saved'  ;;
	2.delayed_fullscreen) scrot -d 4 '%F_%H%M%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Fullscreen screenshot saved'    ;;
	3.section) scrot -s '%F_%H%M%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Screenshot of section saved'    ;;
  	*) exec "'${cmd}'"  ;;
esac

