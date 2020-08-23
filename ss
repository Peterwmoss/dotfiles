#!/bin/zsh
source ~/.config/zsh/ssdir
scrot -s '%s.png' -e 'mv $f ~/pictures/scrot'
echo $(ls "$HOME/pictures/scrot") > ~/test
mv /home/peter/pictures/scrot/*.png $SSDIR
