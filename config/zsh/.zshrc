export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.local/share/zsh/history

#ZSH_THEME="robbyrussell"
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
path+=("$HOME/.local/bin")
path+=("$HOME/.scripts/")
path+=("$HOME/.scripts/pfetch")
export PATH

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
alias dwmc="cd ~/git/dwm/ && vim config.h"

# Safety for deleting and overwriting
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Easy vim
alias vim="nvim"
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

# Start coding
alias oscex="cd ~/School/5/osc/exercises && alacritty &"
alias ssosc="echo 'export SSDIR=/home/peter/School/5/osc/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias sspsd="echo 'export SSDIR=/home/peter/School/5/psd/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias ssfop="echo 'export SSDIR=/home/peter/School/5/fop/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias sspics="echo 'export SSDIR=/home/peter/pictures/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"

alias cdosc="cd $HOME/School/5/osc"
alias cdpsd="cd $HOME/School/5/psd"
alias cdfop="cd $HOME/School/5/fop"

source ~/.config/zsh/ssdir

# Git
alias addall="git add -A"
alias fetch="git fetch"
alias pull="git pull"
alias push="git push"
alias commit="git commit -m"
alias commitall="git commit -am"

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

codi() {
    nvim -c "Codi python"
}

fortune | cowsay | lolcat


