#!/bin/bash
#uncomments all config lines that are designated and kills all windows
#python3 ~/.scripts/toggle_comments.py ~/.config/i3/config 0 -1
i3-msg '[instance="^(?!xterm).*$"] kill' 
sleep 1s
shutdown -h now
