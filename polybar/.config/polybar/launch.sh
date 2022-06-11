#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

bars=(main)

# Launch Polybar, using default config location ~/.config/polybar/config
for bar in ${bars[@]}; do
    polybar $bar 2>&1 | tee -a /tmp/polybar.log & disown
done
