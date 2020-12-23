#!/usr/bin/bash

# Dmenu script to browse video library
set -xv
select_type() {
    cd /home/four/Videos
    TYPE="$(ls | dmenu -c -l 2 -i -p 'Videos:')"
    [[ $? == 1 ]] && exit 1
    cd $TYPE
    [[ "$(basename "$PWD")" == "Movies" ]] && play_movie || select_show
}

play_movie() {
    MOVIE="$(ls | dmenu -c -l 6 -i -p 'Movies:')"
    if [[ $? == 1 ]];
    then
        select_type
    else
        cd "$MOVIE"
        pwd
        find . -name '*.mkv' -o -name '*.mp4' -o -name '*.avi' -exec mpv '{}' \;
    fi
}

play_show() {
    EPISODES="$(find . -name '*.mkv' -o -name '*.mp4' -o -name '*.avi' | wc -l)"
    EP="$(for (( c=1; c<=$EPISODES; c++ )); do echo "$c"; done | dmenu -c -l 8 -i -p "$SEASON")"
    if [[ $? == 1 ]];
    then
        select_season
    else
        [[ $EP -lt 10 ]] && EP="0$EP"
        EP="E$EP"
        find . -name "*$EP*.mkv" -exec mpv '{}' \;
    fi
}

select_season() {
    TITLE="$(basename "$PWD" | tr '_' '\ ')"
    SEASON="$(ls | grep "Season*" | dmenu -c -l 5 -i -p "$TITLE")"
    if [[ $? == 1 ]];
    then
        cd ..
        select_show
    else
        cd $SEASON
        play_show
    fi
}

select_show() {
    SHOW="$(ls | dmenu -c -l 6 -i -p 'TV:')"
    if [[ $? == 1 ]];
    then
        select_type
    else
        cd $SHOW
        select_season
    fi
}

main() {
    select_type
}

main
