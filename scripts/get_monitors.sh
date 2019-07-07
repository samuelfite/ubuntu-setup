#!/bin/bash
xrandr | grep -G " connected" | awk '{print $1}'
