#!/bin/env sh

if type "xrandr"; then
    if xrandr --query | grep " connected" | grep "VGA1"; then
        /bin/sh $HOME/.screenlayout/home.sh
    else
        /bin/sh $HOME/.screenlayout/laptop-only.sh
    fi
fi
