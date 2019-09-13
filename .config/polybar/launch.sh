#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar -r ashes 2>~/.log/polybar &

echo "Polybar launched..."
notify-send "Polybar Launched"

#if [ -n "$(pgrep bspwm)" ]; then
#
#	bspc config top_padding 19
#
#fi
