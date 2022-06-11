#!/bin/bash

# just dont ask
volume=$(pactl list sinks | grep -m 1 "Volume" | awk '{print $5}' | tr -d "%")

muted=$(pactl list sinks | grep -m 1 "Mute" | awk '{print $2}')

if [ "$muted" = "yes" ]; then
    symbol=""
else
    if [ $volume -le 30 ]; then
        symbol=""
    elif [ $volume -le 60 ]; then
        symbol=""
    else
        symbol=""
    fi
fi

symbol_text="<span font=\"Symbols Nerd Font\">$symbol</span>"
echo "$symbol_text $volume%"
