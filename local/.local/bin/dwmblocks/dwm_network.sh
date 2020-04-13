#!/bin/bash
# Script to determine whether there is an active network connection

NET=$(nmcli -a | awk '/^wlp59s0/' | awk '{ print $2 }')

if [[ "$NET" == "connected" ]]; then
    echo "  "
else
    echo ""
fi

