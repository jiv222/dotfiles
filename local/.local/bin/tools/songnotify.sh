#/usr/bin/bash

# Do not notify if the song hasn't been changed
# i.e. play/pause
[[ "$PLAYER_EVENT" == "change" ]] || exit 1

# Delete previous album art
rm ~/.config/spotifyd/tmp/AlbumArt.png

# Get song metadata
artist="$(playerctl metadata --format "{{ artist }}")"
album="$(playerctl metadata --format "{{ album }}")"
# Get album art for icon
sacad "${artist}" "${album}" 90 ~/.config/spotifyd/tmp/AlbumArt.png 

# Create notification
notif=$(playerctl metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
notify-send "Spotify" "$notif" --icon=~/.config/spotifyd/tmp/AlbumArt.png