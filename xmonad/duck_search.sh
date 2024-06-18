#!/bin/bash

if [ -n "${1}" ]; then
    echo ${1} >> ~/.cache/duck_history
    librewolf "https://duckduckgo.com/?q=${1}"
    exit 0
else
    tail /home/light/.cache/duck_history | tac
fi
