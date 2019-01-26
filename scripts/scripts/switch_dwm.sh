#!/bin/bash

if [ $# -lt 1 ]
  then
    # Incorrect amount of arguments supplied
    echo "$@"
    exit 1
fi

args=("$@")

cd "${HOME}/suckless-tools/src/dwm"
if [ ! -f config-"${args[0]}".h ]; then
    echo "File config-${args[0]}.h not found!"
    exit 1
fi

unlink config.h
ln -s config-"${args[0]}".h config.h

make clean install && pkill -x dwm && echo ${args[0]} > /tmp/DWM_PROFILE
