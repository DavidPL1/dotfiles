#!/bin/bash

### ENV VARS

# STANDARD SHELL IS ZSH (not via chsh to disable zsh on ssh and login)
export SHELL=/bin/zsh
# Fix empty idea tool windows
export _JAVA_AWT_WM_NONREPARENTING=1 exec $1

### Programs to run on login

# Status bar
slstatus &
export PID_SLSTATUS=$!
# color regularization for daytime
redshift &
export PID_REDSHIFT=$!
# Set wallpaper
feh --bg-scale /home/spectre/.wallpaper_br
switch_dwm work

# Check for file as logout flag
while [ ! -f /tmp/DWM_LOGOUT ]; do
	ssh-agent dwm
done

### Cleanup on logout

# Remove logout flag file to reset for next login
rm /tmp/DWM_LOGOUT
kill $PID_SLSTATUS
kill $PID_REDSHIFT
