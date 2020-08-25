#!/bin/bash

# If VPN is connected, get name of connection/server.
name="$(nmcli c | grep vpn | grep wlp59s0 | awk '{ print $1 }' | tr '[:lower:]' '[:upper:]')"

# Output VPN name
[ -z "$name" ] && echo " VPN:OFF " && exit 1
echo " VPN:$name "
