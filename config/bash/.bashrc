export PATH="$HOME/.local/share/bin/:$HOME/.local/scripts/:$HOME/.local/bin/:$PATH"

export EDITOR='nvim'
export LESSHISTFILE=-

# Configs
alias vimc="nvim ~/.config/nvim/init.vim"
alias zshc="vim $HOME/.config/zsh/.zshrc"
alias bashc="vim $HOME/.config/bash/.bashrc"
alias csgoc="vim /home/peter/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg"
alias dwmc="cd ~/git/suckless-builds/dwm/ && vim config.h"

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

# School stuff
alias oscex="cd ~/School/5/osc/exercises && alacritty &"
alias ssosc="echo 'export SSDIR=/home/peter/School/5/osc/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias sspsd="echo 'export SSDIR=/home/peter/School/5/psd/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias ssfop="echo 'export SSDIR=/home/peter/School/5/fop/notes/img/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"
alias sspics="echo 'export SSDIR=/home/peter/pictures/' > ~/.config/zsh/ssdir && source ~/.config/zsh/ssdir"

alias cdosc="cd $HOME/School/5/osc"
alias cdpsd="cd $HOME/School/5/psd"
alias cdfop="cd $HOME/School/5/fop"

alias mntfallon="sshfs group87@fallon.itu.dk:/home/group87 ./fallon"

source ~/.config/zsh/ssdir

# Git
alias addall="git add -A"
alias add="git add"
alias addp="git add -p"
alias stash="git stash"
alias pop="git stash pop"
alias status="git status"
alias fetch="git fetch"
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
alias world="doas emerge --changed-use --update --deep @world"

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

RESET="\033[0;00m"

function git_status() {
    GIT_DIR=$(git rev-parse --git-dir)
    if [[ ! -z "$GIT_DIR" ]]
    then
        GIT="\[$(tput setaf 166)\] $(git branch --show-current) "

        # Add remote to prompt
        if [[ ! -z $(git remote) ]]
        then
            GIT="$GIT $(git remote) "
            DIFF=$(git rev-list --left-right $(git branch --show-current)...$(git remote)/$(git branch --show-current) --count)
            ORIGIN=$(echo $DIFF | awk '{print $2}')
            LOCAL=$(echo $DIFF | awk '{print $1}')

            # Remote status
            if [[ ! "$LOCAL" -eq "0" ]]
            then
                GIT_STATUS="$GIT_STATUS"
            fi
            if [[ ! "$ORIGIN" -eq "0" ]]
            then
                GIT_STATUS="$GIT_STATUS"
            fi
        fi

        # Add local git status to prompt
        UNTRACKED=$(git ls-files -o --exclude-standard)
        DELETED=$(git ls-files -d --exclude-standard)
        STAGED=$(git diff --name-only --cached)
        MODIFIED=$(git ls-files -m --exclude-standard)

        if [[ ! -z "$UNTRACKED" ]]
        then
            GIT_STATUS="?"
        fi
        if [[ ! -z "$DELETED" ]]
        then
            GIT_STATUS="$GIT_STATUS"
        fi
        if [[ ! -z "$STAGED" ]]
        then
            GIT_STATUS="$GIT_STATUS+"
        fi
        if [[ ! -z "$MODIFIED" ]]
        then
            GIT_STATUS="$GIT_STATUS!"
        fi

        # Combine
        if [[ ! -z $GIT_STATUS ]]
        then
            GIT="$GIT {$GIT_STATUS}\[$RESET\]"
        else
            GIT="$GIT\[$RESET\]"
        fi
    else
        GIT=""
    fi
    echo $GIT
}

function set_bash_promt() {
    PS1="\[$(tput bold)$(tput setaf 1)\][\[$(tput setaf 6)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\H\[$(tput setaf 1)\]] \[$(tput setaf 7)\] \[$(tput setaf 5)\]\w $(git_status)\n\[$(tput setaf 2)$(tput bold)\]\\$\[$RESET\] "
}

export PROMPT_COMMAND=set_bash_promt
