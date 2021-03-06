#!/bin/bash
# Script to provide battery information to dwm status bar

dwm_battery() {
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [[ "$STATUS" == "Full" ]]; then
        echo "  FULL "
    elif [[ $CHARGE -gt 90 ]]; then
        echo "  $CHARGE% "
    elif [[ $CHARGE -gt 70 ]]; then
        echo "  $CHARGE% "
    elif [[ $CHARGE -gt 40 ]]; then
        echo "  $CHARGE% "
    elif [[ $CHARGE -gt 20 ]]; then
        echo "  $CHARGE% "
    else
        echo "  $CHARGE% "
    fi
}

dwm_battery

