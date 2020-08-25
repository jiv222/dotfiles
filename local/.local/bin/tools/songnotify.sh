#!/usr/bin/bash

# Signal for dwmblocks to update
kill -46 $(pidof dwmblocks)

# Do not notify if the song hasn't been changed
# i.e. play/pause
[ "$PLAYER_EVENT" == "change" ] || { printf '%s\n' "Only notify for new songs." >&2; exit 5; }

# Delete previous album art
rm ~/.cache/AlbumArt.png

# Get song metadata
metadata="$(playerctl metadata --format "{{ artist }};{{ album }}")"
IFS=';' read -r -a meta_array <<< "$metadata"

arist="${meta_array[0]}"
album="${meta_array[0]}"

# Get album art for icon
sacad "${artist}" "${album}" 90 ~/.cache/AlbumArt.png 

# Create notification
notif=$(playerctl metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
notify-send "Spotify" "$notif" --icon=~/.cache/AlbumArt.png
