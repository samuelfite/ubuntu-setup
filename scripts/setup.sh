#!/bin/sh
echo "Enter the number corresponding to monitor setup: \n0 : Laptop \n1 : Vertical\n2 : Dual"
echo "--------------"
read choice
echo "--------------"
# run specific startup scripts based on the monitor layout
if [ "$choice" = "0" ]; then
  /home/sam/.scripts/laptop_arandr.sh
  /home/sam/.scripts/wallpaper.sh
  #modify conf for workspaces all on laptop
  python3 /home/sam/.scripts/toggle_comments.py /home/sam/.config/i3/config 1 2
  sleep 1
  #restart i3
  i3-msg reload 
  i3-msg restart
  sleep 1s
  # turn on i3 focus
  python3 /home/sam/.scripts/toggle_comments.py /home/sam/.config/i3/config 1 1
  sleep 2s
  i3-msg reload 
  i3-msg restart
  sleep 1s
elif [ "$choice" = "1" ]; then
  #logging in, everything should be uncommented
  /home/sam/.scripts/vertical_arandr.sh
  sleep 2s
  /home/sam/.scripts/vert_wallpaper.sh
  #open startup apps
  sleep 2s
  i3-msg 'workspace 10; exec xterm -hold'
  i3-msg 'workspace 10; exec xterm -hold -e exec $(xterm -hold -e calcurse)'
  sleep 1s
  i3-msg 'workspace 4; exec xterm -hold'
  i3-msg 'workspace 4; exec xterm -e exec $(google-chrome &)'
  sleep 1s
  i3-msg 'workspace 2; exec xterm -hold'
  i3-msg 'workspace 2; exec xterm -e exec $(spotify &)'
  sleep 1.5s
  i3-msg 'workspace 2; exec xterm -e exec $(xterm -hold -e pulsemixer)'
  sleep 1s
  i3-msg 'workspace 1; exec xterm -hold'
  i3-msg 'workspace 1; exec xterm -e exec $(slack &)'
  sleep 3s
  # turn on i3 focus
  #python3 /home/sam/.scripts/toggle_comments.py /home/sam/.config/i3/config 1 1
  #sleep 2s
  #i3-msg reload 
  #i3-msg restart
  #sleep 1s
elif [ "$choice" = "2" ]; then
  /home/sam/.scripts/monitors_arandr.sh
  /home/sam/.scripts/wallpaper.sh
fi
echo "exiting..."
#sleep 3s
#exit
