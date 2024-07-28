alias cl='clear'
alias l='ls -l --color'
alias ll='l -a'
alias pjson='python -m json.tool'
alias diepyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias flushdns='sudo killall -INFO mDNSResponder'
alias d='docker'
alias dc='docker-compose'
alias ssh="TERM=xterm-256color /usr/bin/ssh"
alias orbd="TERM=xterm-256color orb debug"
alias mutt="cd ~; neomutt"

alias gr='cd $(git rev-parse --show-toplevel)'
alias vwd='ink_fzf'

alias cat='bat'
alias j='just'
alias g='git'

# one day i'll pick
alias vi='nvim'
alias vim='nvim'

alias bad_docker_volumes='comm -2 -3 <(docker volume ls -q | sort) <(docker volume ls -q -f name=postgres -f name=search| sort)'


function load_google_trash() {
    alias k='kubectl'
    export PATH=$PATH:$HOME/.google/bin

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/jacob/.google/path.zsh.inc' ]; then . '/Users/jacob/.google/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/jacob/.google/completion.zsh.inc' ]; then . '/Users/jacob/.google/completion.zsh.inc'; fi
}
alias kc='load_google_trash'

function docker_compose_debug() {
    echo "orb debug $(docker compose ps -q $1) '${@:1}'"
    TERM=xterm-256color orb debug $(docker compose ps -q $1) "${@:2}"
}
alias dcd='docker_compose_debug'
