#!/bin/bash

while inotifywait -qqe close_write /tmp/.xmonad-workspace-log; do
    tail -1 /tmp/.xmonad-workspace-log

done
