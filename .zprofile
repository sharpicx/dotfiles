if [[ $(tty) = "/dev/tty1" ]]; then
	pgrep bspwm || startx /home/via/.xinitrc 1>/dev/null
fi
