#!/usr/bin/bash

cd /home/four/Books
BOOK="$(/usr/bin/ls | dmenu -i -c -l 6 -p "Open:")"
[[ -z "$BOOK" ]] && exit || zathura $BOOK
