alias cl='clear'
alias l='ls -l --color'
alias ll='l -a'
alias pjson='python -m json.tool'
alias diepyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias flushdns='sudo killall -INFO mDNSResponder'
alias d='docker'
alias dc='docker-compose'
alias ssh="TERM=xterm-256color /usr/bin/ssh"
alias mutt="cd ~; neomutt"
alias neomutt="neomutt"

alias gr='cd $(git rev-parse --show-toplevel)'
alias vwd='ink_fzf'

alias cat='bat'
alias j='just'
alias g='git'

# one day i'll pick
alias vi='nvim'
alias vim='nvim'

alias bad_docker_volumes='comm -2 -3 <(docker volume ls -q | sort) <(docker volume ls -q -f name=postgres -f name=search| sort)'
