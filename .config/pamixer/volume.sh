#! /bin/bash

# Author: sharpicx 
# Copyright (C) picx.space

case $1 in
        up)
                pamixer -i 5
                volume="$(pamixer --get-volume)"
                dunstify "VOLUME" "Volume get increasing to $volume%" -h int:value:$volume -i audio-volume-high 
                canberra-gtk-play -i audio-volume-change -d "changevolume"
                ;;
        down)
                pamixer -d 5
                volume="$(pamixer --get-volume)"
                dunstify "VOLUME" "Volume get decreasing to $volume%" -h int:value:$volume -i audio-volume-low 
                canberra-gtk-play -i audio-volume-change -d "changevolume"
                ;;
        mute)
                pamixer -t
                muted="$(pamixer --get-mute)"
                if $muted ; then
                        dunstify "VOLUME" "Volume is getting muted!" -i audio-volume-muted-blocking -u low
                else
                        dunstify "VOLUME" "Volume aint muted!" -i audio-volume-high -u low
                        canberra-gtk-play -i audio-volume-change 
                fi
                ;;
esac

