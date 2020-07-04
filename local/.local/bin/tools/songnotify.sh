#/usr/bin/bash

# Signal for dwmblocks to update
kill -46 $(pidof dwmblocks)

# Do not notify if the song hasn't been changed
# i.e. play/pause
[[ "$PLAYER_EVENT" == "change" ]] || exit 1

# Delete previous album art
rm ~/.config/spotifyd/tmp/AlbumArt.png

# Get song metadata
metadata="$(playerctl metadata --format "{{ artist }};{{ album }}")"
IFS=';' read -r -a meta_array <<< "$metadata"

arist="${meta_array[0]}"
album="${meta_array[0]}"

# Get album art for icon
sacad "${artist}" "${album}" 90 ~/.config/spotifyd/tmp/AlbumArt.png 

# Create notification
notif=$(playerctl metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
notify-send "Spotify" "$notif" --icon=~/.config/spotifyd/tmp/AlbumArt.png
