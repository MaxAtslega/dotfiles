#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom.conf --experimental-backends --vsync &

#polybar
~/.config/i3/polybar/launch.sh &

#background
nitrogen --restore &
clipmenud &
dunst &

udiskie &

setxkbmap -layout de &

~/.config/i3/pipewire.sh &

# dex
dex --autostart --environment i3 &
