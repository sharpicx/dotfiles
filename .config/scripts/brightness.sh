#! /bin/bash

# Author: sharpicx 
# Copyright (C) picx.space

case $1 in
        up)
                brightnessctl s +5%
                brightness="$(brightnessctl i | grep "Current brightness" | cut -d " " -f4)"
                dunstify "BRIGHTNESS" "Increasing to $brightness" -t 600
                canberra-gtk-play -i device-added
                ;;
        down)
                brightnessctl s 5%-
                brightness="$(brightnessctl i | grep "Current brightness" |     cut -d " " -f4)"
                dunstify "BRIGHTNESS" "Decreasing to $brightness" -t 600
                canberra-gtk-play -i device-added
                ;;
esac

