#!/bin/bash

killall rofi
killall dunst
killall sxkhd

dunst & 
sxhkd -c ~/.config/sxhkd/awesome-config &
dockd --daemon &

reload-polybar-awesome
