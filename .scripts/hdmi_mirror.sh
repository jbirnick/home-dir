#!/bin/bash

xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --same-as eDP-1 --rotate normal
bspc wm -O eDP-1 HDMI-1
bspc monitor HDMI-1 -r
