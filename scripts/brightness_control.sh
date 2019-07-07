#!/bin/bash
#usage brightness_control.sh <up,down> <0,1,2>("which of 3 monitors with 0 being laptop")
res=$(~/.scripts/get_monitors.sh)
ar=($res)
current_barr=($(xrandr --verbose | grep -i brightness | awk '{print $2}'))
direction=" "
if [[ "$1" == "down" ]]; then
  direction="-" 
else
  direction="+" 
fi
echo "Current brightness: ${current_barr[$2]}"
val=$(echo "${current_barr[$2]} ${direction} 0.1" | bc)
echo "New brightness: ${val}"
xrandr --output "${ar[$2]}" --brightness "${val}"
