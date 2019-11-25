export ZSH="/home/peter/.oh-my-zsh"
ZSH_THEME="miloshadzic"

plugins=(
	docker
	git
	gitfast
	git-extras
	npm
	wd
	archlinux
	extract
)

source $ZSH/oh-my-zsh.sh

source $HOME/.dots/.zsh-aliases

path+=('/home/peter/apps/azuredatastudio-linux-x64/bin')
path+=('/opt/dotnet/sdk/3.0.100/Sdks')
path+=('/usr/lib/jvm/jdk-11/bin/')

export ANDROID_SDK_PATH=$HOME/Android/Sdk
export ANDROID_NDK_PATH=$HOME/Android/Sdk/ndk-bundle

export PATH

eval $(keychain --eval --quiet id_rsa)
eval $(keychain --eval --quiet itu_rsa)

stty -ixon

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
