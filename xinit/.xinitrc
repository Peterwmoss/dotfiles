#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge $HOME/.config/X11/xresources
wal -R > /dev/null
setxkbmap dk
setxkbmap -option caps:escape
xset r rate 400 75
spotifyd
nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings -l &
exec $HOME/git/dotfiles/xinit/startdwm
