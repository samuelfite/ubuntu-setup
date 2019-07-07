#!/bin/bash
res=$(xclip -selection c -o) 
notify-send "youtube-dl" "Downloading: "${res}""
eval $(youtube-dl "${res}")

