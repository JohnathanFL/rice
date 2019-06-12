# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


export RICE=~/.configs

export TERM="xterm-256color"

# ANTIGEN
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen theme agnoster

antigen apply


BULLETTRAIN_PROMPT_CHAR="λ"

fortune | cowsay

export PATH="$HOME/.cargo/bin/:/$HOME/.nimble/bin:/$HOME/bin:$PATH"
export SCONS_CACHE=/home/oakenbow/Dev/Scons_Cache
export SCONS_CACHE_ROOT=/home/oakenbow/Dev/Scons_Cache
alias autoyay="yay --noconfirm --sudoloop"
alias ls='ls -s --block-size=M --color=auto' # show sizes in ls
alias mkdir='mkdir -pv' # always make parent dirs


if [[ $1 != "no-wayland" ]]
then
	export QT_QPA_PLATFORM=wayland
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export GDK_BACKEND=wayland
	export SDL_VIDEODRIVER=wayland
	echo "Wayland enabled"
else
	export QT_QPA_PLATFORM=xcb
	#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export GDK_BACKEND=x11
	export SDL_VIDEODRIVER=x11
	echo "Wayland disabled"
fi

alias zsh-disable-wayland='source ~/.zshrc no-wayland'


TRAPUSR1() {
	if [[ -o INTERACTIVE ]]; then
		{clear; echo ZSH Reloaded} 1>&2
			exec "${SHELL}"
		fi
	}

alias reloadzsh="pkill -usr1 zsh"

