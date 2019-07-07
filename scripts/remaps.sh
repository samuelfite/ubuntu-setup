#!/bin/sh
# This script is called by i3 on startup to remap keys.
# Increase key speed via a rate change
xset r rate 250 80
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' -t 200
# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'