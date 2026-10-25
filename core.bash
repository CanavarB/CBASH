#!/usr/bin/env bash


#=============CONF===================
WORKSPACE_PATH="$HOME/Workspace"
CB_PS1="\[\033[1m\]\[\e[38;5;255m\]\u\[\e[38;5;124m\]@\[\e[38;5;9m\]\h\[\e[38;5;87m\]:\w$\[\033[0m\] "
WORKSPACE_PS1="\[\033[1m\]\[\e[38;5;255m\]⯌ \[\e[38;5;229m\]\w \[\e[38;5;255m\]$ \[\033[0m\]"
RASPBERRY_PS1="\[\e[38;5;124m\]\u\[\e[38;5;2m\]@\[\e[38;5;9m\]\h \[\e[38;5;41m\]\w$\[\033[0m\]"
JETSON_PS1="\[\e[38;5;250m\]\u\[\e[38;5;46m\]@\[\e[38;5;34m\]\h \[\e[38;5;215m\]\w$\[\033[0m\]"
DEFAULT_PS1=$CB_PS1

declare -A DIR_PS1_MAP=(
    ["$WORKSPACE_PATH"]="$WORKSPACE_PS1"
)

#=============CONF===================

change_ps1_in_dir() {
    local dir

    PS1="$DEFAULT_PS1"

    for dir in "${!DIR_PS1_MAP[@]}"; do
        if [[ "$PWD" == "$dir" || "$PWD" == "$dir/"* ]]; then
            PS1="${DIR_PS1_MAP[$dir]}"
            return
        fi
    done
}

change_ps1_in_dir

cbcd() {
    cd "$@"
    change_ps1_in_dir
}

alias cd='cbcd'

mcdir() {
    mkdir -p -- "$1" && cd -- "$1"
}


alias ..="cd .."
alias ...="cd ../.."
alias lt1="ls -t | head -1"
alias change='watch -d -n 0.1'
alias cpy='xclip -selection clipboard'
alias pst='xclip -o -selection clipboard'
alias screen-off='xset dpms force off'