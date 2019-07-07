#!/bin/bash
WHEREAMI=$(cat /tmp/whereami)
xterm -e "cd $WHEREAMI && /bin/bash"
