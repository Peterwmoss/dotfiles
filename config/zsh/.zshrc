export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=$HOME/.cache/zsh/history

path+=("$HOME/.local/share/cargo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/scripts")
path+=("$HOME/.ghcup/bin/")
path+=("$HOME/.local/share/npm/bin/")
path+=("$HOME/.dotnet/")
path+=("$HOME/.sdkman/bin/sdkman-init.sh")
path+=("/opt/openjdk-bin-11")
export PATH

export JDK_HOME="/opt/openjdk-bin-18"

export EDITOR='pvim'
export XDG_DATA_HOME=$HOME/.local/share
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
alias vimc="pvim ~/.config/nvim/init.vim"
alias zshc="pvim $HOME/.config/zsh/.zshrc"
alias csgoc="pvim /home/peter/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg"
alias dwmc="cd ~/git/suckless-builds/dwm/ && vim config.h"

# Safety for deleting and overwriting
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Easy vim
alias v="nvim"
alias pv="pvim"

alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""

# Pretty ls and grep
# alias ls="lsd"
# alias lt="ls --tree"
# alias lla="ls -la"
alias grep="grep --color=auto"

# C see stacktrace of crashing program
alias gdbs="gdb --batch --ex run --ex bt --ex q --args"

alias gw="./gradlew"

# Git
alias addall="git add -A"
alias add="git add"
alias addp="git add -p"
alias stash="git stash"
alias pop="git stash pop"
alias status="git status"
alias fetch="git fetch --prune"
alias pull="git pull"
alias push="git push"
alias commit="git commit"
alias commitm="git commit -m"
alias gitlog="git log --all --graph --decorate --oneline --abbrev=8"

# Tmux
alias tn="tmux -u new -s"
alias ta="tmux -u attach -t"
alias tc="nvim ~/git/dotfiles/config/tmux/tmux.conf"
alias work="tmux -u attach -t work || tmux -u new -s work -c ~/work/fst/git"
alias config="tmux -u attach -t config || tmux -u new -s config -c ~/git/dotfiles/config"

# QMarkdown
alias qm="qmarkdown -dark"

# PKGBUILDS
alias updpkg="makepkg - g >> PKGBUILD && rm -rf src *.tar.gz && makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO && git commit -m"

# Word count
alias pagecount="wc -m | tr -d '\n' | awk '{print \$1\"/2400\"}' | bc -l"

alias dndscreen="xrandr --output HDMI1 --right-of ePD1 --mode 2560x1440"

# Kubernetes

alias k8s-dev-1-5="kubectl config use-context gov-1-5; kubectl config set-context --current --namespace=iam-development"
alias k8s-test-1-5="kubectl config use-context gov-1-5; kubectl config set-context --current --namespace=iam-test"
alias k8s-local="kubectl config use-context minikube; kubectl config set-context --current --namespace=iam-local"

# FST
alias fstkube="kubectl --kubeconfig ~/.kube/racher-config"
alias fstk9s="k9s --kubeconfig ~/.kube/racher-config"

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

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source "$ZDOTDIR/.zshenv"
source "${ZDOTDIR:-$HOME}/zprezto/init.zsh"

export GOBIN="$HOME/.local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(zoxide init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
