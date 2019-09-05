# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Darks
export NORD_DARK0=#2e3440
export NORD_DARK1=#3b4252
export NORD_DARK2=#434c5e
export NORD_DARK3=#4c566a

# Lights
export NORD_LIGHT0=#d8dee9
export NORD_LIGHT1=#e5e9f0
export NORD_LIGHT2=#eceff4

# Frosts
export NORD_FROST0=#8fbcbb
export NORD_FROST1=#88c0d0
export NORD_FROST2=#81a1c1
export NORD_FROST3=#5e81ac

export NORD_AURORA0=#bf616a
export NORD_AURORA1=#d08770
export NORD_AURORA2=#ebcb8b
export NORD_AURORA3=#a3be8c
export NORD_AURORA4=#b48ead

export RICE=~/.configs

export TERM="xterm-256color"
export EDITOR="vim"

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
export PKGEXT=".pkg.tar"


alias autoyay="yay --noconfirm --sudoloop"
alias ls='ls -s --block-size=M --color=auto' # show sizes in ls
alias mkdir='mkdir -pv' # always make parent dirs
alias code='GDK_BACKEND=x11 code'
alias startx='zsh-disable-wayland && startx'

if [[ $1 != "no-wayland" ]]
then
	export QT_QPA_PLATFORM=wayland
	export QT_WAYLAND_FORCE_DPI=logical
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export GDK_BACKEND=wayland
	export SDL_VIDEODRIVER=wayland
	export _JAVA_AWT_WM_NONREPARENTING=1
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

