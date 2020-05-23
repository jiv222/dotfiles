#!/bin/bash
# Script to determine whether there is an active network connection

RESP=$(nmcli -a | awk '/^wlp59s0/')
NET=$(echo $RESP | awk '{ print $2 }')

if [[ "$NET" == "connected" ]]; then
    NAME=$(echo $RESP | awk '{ print $4 }')
    echo "$NAME "
else
    echo ""
fi

