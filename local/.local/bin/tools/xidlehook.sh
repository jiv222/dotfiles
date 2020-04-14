#!/usr/bin/bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
    `# Don't lock when there's a fullscreen application` \
    --not-when-fullscreen \
    `# Don't lock when there's audio playing` \
    --not-when-audio \
    `# Dim the screen after 3 minutes, undim if user becomes active` \
    --timer 180 \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
    `# Undim & lock after 15 more seconds` \
    --timer 30 \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; gllock' \
        '' \
    `# Finally, suspend an hour after it locks` \
    --timer 3600 \
        'zzz' \
        ''
