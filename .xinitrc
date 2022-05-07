#!/bin/sh

usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


exec $1

twm &
exec bato &
exec xclock -geometry 50x50-1+1 &
exec xterm -geometry 80x50+494+51 &
exec xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login &
exec xsetroot -cursor_name left_ptr &
exec setxkbmap ch &
exec pulseaudio --start -k -D &
exec picom --experimental-backend &
exec sxhkd &
exec bspwm &
