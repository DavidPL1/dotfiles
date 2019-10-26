#!/bin/sh
val=$(cat /sys/class/backlight/intel_backlight/brightness)
echo $((val - 75)) > /sys/class/backlight/intel_backlight/brightness
val=$(cat /sys/class/backlight/intel_backlight/brightness)
echo $((val * 100 / 1515))%

