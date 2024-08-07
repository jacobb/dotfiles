export EDITOR='nvim'
export XDG_CONFIG_HOME='/Users/jacob/.config'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"
export PATH="/Users/jacob/.cargo/bin:$PATH"
source "$HOME/.rye/env"

bindkey -e
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

alias gc='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

source $XDG_CONFIG_HOME/zsh/prompt.sh
source $XDG_CONFIG_HOME/zsh/aliases.sh
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

eval "$(atuin init zsh --disable-up-arrow)"

fpath=($XDG_CONFIG_HOME/zsh/completions $fpath)
autoload -U compinit
compinit
