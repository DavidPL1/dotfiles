#!/bin/bash

killall rofi
killall dunst
killall sxkhd

dunst & 
sxkhd &

reload-polybar-awesome
