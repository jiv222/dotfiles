#!/bin/sh
# Script to check for updates in xbps, pacman, and aur

doas /usr/bin/xbps-install --sync > /dev/null 2>&1
doas /bedrock/cross/bin/pacman -Sy > /dev/null 2>&1
voidupd=$(xbps-install --update  --dry-run | wc -l)
pacupd=$(checkupdates | wc -l)
aurupd=$(checkupdates-aur | wc -l)
archupd=$(( $pacupd + $aurupd ))

if [ "$archupd" -gt 0 ] && [ "$voidupd" -gt 0 ]; then
    printf "  A:%sV:%s\n " "$archupd" "$voidupd"
elif [ "$archupd" -eq 0 ] && [ "$voidupd" -eq 0 ]; then
    printf "  \n"
elif [ "$archupd" -eq 0 ]; then
    printf "  V:%s \n" "$voidupd"
else
    printf "  A:%s \n" "$archupd"
fi

