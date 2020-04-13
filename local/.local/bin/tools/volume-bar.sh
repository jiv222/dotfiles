#!/bin/bash
# Script to format volume level from volume.sh for dwmbar

vol="$(volume.sh status)"

if [[ $vol -gt 75 ]] ; then
    out=" $vol%"
elif [[ $vol -gt 25 ]] ; then
    out=" $vol%"
elif [[ $vol -ne 0 ]] ; then
    out=" $vol%"
else
    out=""
fi

echo $out
