#!/usr/bin/bash

d() {
    d=$(date +"%a %b %d [%R]")
    echo -e "+@fg=1;date+@fg=0; $d "
}

bat() {
    bat=$(/home/four/.local/bin/dwmblocks/dwm_battery.sh | awk '{ print $2 }')
    echo -e "+@fg=1;bat+@fg=0; $bat "
}

wifi() {
    net=$(/home/four/.local/bin/dwmblocks/dwm_network.sh)
    echo -e "+@fg=1;wifi+@fg=0; $net "
}

bitcoin() {
    price=$(/home/four/.local/bin/dwmblocks/dwm_bitcoin.sh)
    echo -e "+@fg=1;btc+@fg=0; $price "   
}

vol() {
    vol=$(/home/four/.local/bin/dwmblocks/dwm_volume.sh | awk '{ print $2 }')
    echo -e "+@fg=1; vol +@fg=0; $vol  "
}

SLEEP_SEC=2
while :; do
    echo "$(bitcoin) $(wifi) $(bat) $(vol) $(d)"
    sleep $SLEEP_SEC
done

