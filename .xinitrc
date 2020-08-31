#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 400 75
setxkbmap dk
setxkbmap -option caps:escape
xrdb -merge $HOME/.config/X11/xresources
nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings -l
wal -R > /dev/null
spotifyd

dwmblocks &
exec dwm
