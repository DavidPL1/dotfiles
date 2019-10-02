#!/bin/sh

#Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
done

echo "Shutting down..."
