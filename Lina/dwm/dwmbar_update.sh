#!/bin/bash

delim='//'

status()
{
    echo ' [                 '
    echo '[ '
    amixer get Master | grep -o "[0-9]*%\|\[on\]\|\[off\]" | sed "s/\[on\]//" | sed "s/\[off\]//" | head -n 2
    echo ' ] - [ '
    sensors | grep 'Package id 0:' | awk '{ print $4; }'
    echo ' ] - [ '
    date '+%Y %b %d (%a) %I:%M%p'
    echo ' ]                  ]'
}

xsetroot -name "$(status | tr '\n' ' ')"
