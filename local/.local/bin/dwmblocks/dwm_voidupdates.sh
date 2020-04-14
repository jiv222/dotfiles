#!/bin/sh
# Script to check for xbps updates

doas /usr/bin/xbps-install --sync > /dev/null 2>&1
num=$(xbps-install --update  --dry-run | wc -l)
[ -n "$num" ] && echo "$num "
