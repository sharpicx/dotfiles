#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done 
polybar -q "utama" -c /home/via/.config/polybar/config.ini &
polybar -q "status" -c /home/via/.config/polybar/config.ini &
polybar -q "tengah" -c /home/via/.config/polybar/config.ini &
polybar -q "pentest" -c /home/via/.config/polybar/config.ini &
