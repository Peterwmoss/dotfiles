export PATH="$HOME/.local/share/bin/:$HOME/.local/scripts/:$HOME/.local/bin/:$PATH"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
export GPG_TTY=$(tty)
