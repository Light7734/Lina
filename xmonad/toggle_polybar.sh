#!/bin/bash

if pgrep -x 'polybar'; then
    killall 'polybar'
else
    polybar leftbar &
    polybar rightbar &
    polybar centerbar &
fi

exit
