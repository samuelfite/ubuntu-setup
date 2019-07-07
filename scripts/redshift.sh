#!/bin/bash
# using malaysia coordinats to simulate nighttime during workday
PS3='Select Lumens For Light: '
options=("1000" "2000" "2300" "2700" "3400" "4200" "5000" "5800")
select opt in "${options[@]}"
do
  echo 'nohup executing redshift -O "${opt}" &'
  nohup redshift -O $opt &
  break
done
