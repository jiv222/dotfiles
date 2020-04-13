#!/bin/sh
# Script to display current screen brighness. Requires light.

BRI=$(light)
BRI=${BRI%.*}
echo " $BRI "
