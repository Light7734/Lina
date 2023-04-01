#!/bin/bash

if pgrep -x 'picom'; then
    killall 'picom'
else
    picom -b
fi

exit
