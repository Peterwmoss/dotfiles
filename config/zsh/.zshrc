export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.cache/zsh/history

ZSH_THEME="spaceship"

plugins=(
	git
	docker
	npm
	wd
	archlinux
	extract
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# My own path
path+=("$HOME/.local/share/cargo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/scripts")
path+=("$HOME/.ghcup/bin/")
path+=("/opt/openjdk-bin-11")
export PATH

export JDK_HOME="/opt/openjdk-bin-11"

export EDITOR='nvim'
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export LESSHISTFILE=-

###############
### ALIASES ###
###############

# Configs
alias vimc="nvim ~/.config/nvim/init.vim"
alias zshc="vim $HOME/.config/zsh/.zshrc"
alias csgoc="vim /home/peter/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg"
alias dwmc="cd ~/git/suckless-builds/dwm/ && vim config.h"

# Safety for deleting and overwriting
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Easy vim
alias v="nvim"

# Avoid conflicts in doas
# alias doas="doas --"

alias mklatex="mkdir -p notes && cp -r ~/git/dotfiles/LaTeX/templates/report/* notes && cd notes && nvim main.tex"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""

# Pretty ls and grep
alias ls="lsd"
alias lt="ls --tree"
alias lla="ls -la"
alias grep="grep --color=auto"

# C see stacktrace of crashing program
alias gdbs="gdb --batch --ex run --ex bt --ex q --args"

# School stuff
alias cdosc="cd $HOME/School/5/osc"
alias cdpsd="cd $HOME/School/5/psd"
alias cdfop="cd $HOME/School/5/fop"

# Git
alias addall="git add -A"
alias add="git add"
alias addp="git add -p"
alias stash="git stash"
alias pop="git stash pop"
alias status="git status"
alias fetch="git fetch"
alias prune="git fetch --prune"
alias pull="git pull"
alias push="git push"
alias commit="git commit -m"
alias commitall="git commit -am"
alias gitlog="git log --all --graph --decorate --oneline"

# Tmux
alias tn="tmux -u new"
alias ta="tmux -u attach"
alias tc="nvim ~/git/dotfiles/config/tmux/tmux.conf"

# QMarkdown
alias qm="qmarkdown -dark"

# PKGBUILDS
alias updpkg="makepkg - g >> PKGBUILD && rm -rf src *.tar.gz && makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO && git commit -m"

# Gentoo
alias eworld="doas emerge --newuse --update --deep @world"
alias esync="doas emerge --sync --quiet"

# Word count
alias pagecount="wc -m | tr -d '\n' | awk '{print \$1\"/2400\"}' | bc -l"

##########################
### ARCHIVE EXTRACTION ###
##########################

# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
