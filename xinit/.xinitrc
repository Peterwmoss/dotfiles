#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f $HOME/.config/X11/xresources ] ; then
    xrdb -merge $HOME/.config/X11/xresources
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export SSH_AUTH_SOCK

export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$HOME/.local/scripts
$(which wal) -R > /dev/null
nitrogen --restore

$HOME/.local/scripts/kbd

xbacklight -set 30

dunst &

if [ "$(command -v nvidia-settings)" ] ; then
    nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings -l &
fi

if [ "$(command -v nm-applet)" ] ; then
    nm-applet &
fi

# exec qtile start # qtile

exec $HOME/git/dotfiles/xinit/startdwm # DWM
# exec startplasma-x11
# exec bspwm # BSPWM
# exec i3 # i3
