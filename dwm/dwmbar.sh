#!/bin/bash

setxkbmap -model pc104 -layout us,ir -variant , -option grp:rwin_toggle

while :; do
    /home/light/dev/dwm/dwmbar_update.sh
    let a="60 - $(date '+%S')"
    sleep ${a}s
done
