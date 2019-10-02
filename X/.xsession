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

# Bottom right system tray (nm-applet, blueman-applet, ..)
trayer --expand true --edge bottom --align right --widthtype request --transparent true --tint black --SetDockType true
export PID_TRAYER=$!

nm-applet &
blueman-applet &

# Check for file as logout flag
while [ ! -f /tmp/DWM_LOGOUT ]; do

    echo "$(date)" >> /tmp/dwm_logfile
    echo "No logout file found - starting DWM" >> /tmp/dwm_logfile
    dwm >> /tmp/dwm_logfile
done

### Cleanup on logout

# Remove logout flag file to reset for next login
kill $PID_SLSTATUS
kill $PID_REDSHIFT
kill $PID_TRAYER
killall nm-applet
killall blueman-applet
rm /tmp/DWM_LOGOUT
exit
