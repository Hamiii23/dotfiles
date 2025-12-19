# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf z)

source $ZSH/oh-my-zsh.sh

# File System
alias ..="cd .."
alias ...="cd ../.."
alias md="mkdir"
alias rd="rmdir"

alias x="exit"
alias c="clear"
alias vim="nvim"
alias v="/usr/bin/vim"

# Only start Hyprland on a TTY login, not inside another X/Wayland session or a nested terminal
if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $(tty) == /dev/tty1 ]]; then
    exec Hyprland
fi

bindkey -s '^[f' 'tmux-sessionizer\n'
bindkey -s '^[s' 'session-switcher\n'
bindkey -s '^[o' 'tmux-windowizer\n'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# bun completions
[ -s "/home/hamii/.bun/_bun" ] && source "/home/hamii/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
