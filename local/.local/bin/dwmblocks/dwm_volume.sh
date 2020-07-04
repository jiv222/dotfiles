#!/bin/bash
# Script to format and output current volume level

VOL="$(~/.local/bin/tools/volume.sh status)"
VOL=${VOL%.*}

if [[ $VOL -gt 80 ]]; then
    echo " $VOL% "
elif [[ $VOL -gt 50 ]]; then
    echo " $VOL% "
elif [[ $VOL -gt 25 ]]; then
    echo " $VOL% "
elif [[ $VOL -gt 0 ]]; then
    echo " $VOL% "
else
    echo "  "
fi
