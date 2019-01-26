#!/bin/bash

### ENV VARS

# STANDARD SHELL IS ZSH (not via chsh to disable zsh on ssh and login)
export SHELL=/bin/zsh
# Fix empty idea tool windows
export _JAVA_AWT_WM_NONREPARENTING=1 exec $1

### Programs to run on login

# Status bar
slstatus &
# color regularization for daytime
redshift &
# Set wallpaper
feh --bg-scale /home/spectre/.wallpaper_br

while :; do
	ssh-agent dwm
done

switch_dwm work
