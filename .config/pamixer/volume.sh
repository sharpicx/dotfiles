#! /bin/bash

# Author: sharpicx 
# Copyright (C) picx.space

case $1 in
        up)
                pamixer -i 5
                volume="$(pamixer --get-volume)"
                dunstify "VOLUME" "Increasing to $volume%" -h int:value:$volume -i audio-volume-high -t 600
                canberra-gtk-play -i audio-volume-change -d "changevolume"
                ;;
        down)
                pamixer -d 5
                volume="$(pamixer --get-volume)"
                dunstify "VOLUME" "Decreasing to $volume%" -h int:value:$volume -i audio-volume-low -t 600
                canberra-gtk-play -i audio-volume-change -d "changevolume"
                ;;
        mute)
                pamixer -t
                muted="$(pamixer --get-mute)"
                if $muted ; then
                        dunstify "VOLUME" "Volume is muted!" -i audio-volume-muted-blocking -t 600
                else
                        dunstify "VOLUME" "Volume ain't muted!" -i audio-volume-high -t 600
                        canberra-gtk-play -i audio-volume-change 
                fi
                ;;
esac

