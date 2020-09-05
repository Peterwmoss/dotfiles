#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge $HOME/.config/X11/xresources
xset r rate 400 75 &
setxkbmap dk &
setxkbmap -option caps:escape &
nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings -l &
wal -R > /dev/null &
spotifyd &
dwmblocks &
exec $HOME/git/dotfiles/xinit/startdwm
