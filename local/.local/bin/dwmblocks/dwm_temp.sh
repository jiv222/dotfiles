#!/bin/sh
# Script to display current CPU temperature in celcius

printf "%s°C \n" "$(tlp-stat -t | awk '/temp/ { print $4 }')" 
