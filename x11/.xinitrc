#!/bin/sh

userresources=$HOME/.Xresources
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

#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xsetroot -cursor_name left_ptr

#defualt="bspwm"
case "$1" in
    i3|i3wm) exec i3 ;;
    bspwm) exec bspwm ;;
    *) exec bspwm ;;
esac
