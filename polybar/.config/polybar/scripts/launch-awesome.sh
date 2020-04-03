#!/bin/bash
killall sxhkd

sxhkd -c ~/.config/sxhkd/awesome-config & disown
dockd --daemon & disown
reload-polybar-awesome

