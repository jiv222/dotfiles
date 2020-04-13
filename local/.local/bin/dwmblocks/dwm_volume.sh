#!/bin/bash
# Script to format and output current volume level

VOL="$(volume.sh status)"
VOL=${VOL%.*}

if [[ $VOL -gt 50 ]]; then
    echo "  $VOL% "
elif [[ $VOL -gt 10 ]]; then
    echo "  $VOL% "
else
    echo "  $VOL% "
fi
