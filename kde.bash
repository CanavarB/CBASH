#!/usr/bin/env bash


#=============CONF===================
PROJECTS_PATH="$HOME/Workspace/Projects"
#=============CONF===================

alias restart-plasmashell='kquitapp5 plasmashell && kstart5 plasmashell'
cdws() {
    local activity="${1:-$(kactivities-cli --current-activity | awk '{print $3}')}"
    cd -- "$PROJECTS_PATH/$activity"
}

_cdws_completions() {
    local cur="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=()
    if (( COMP_CWORD == 1 )); then
        mapfile -t COMPREPLY < <(
            kactivities-cli --list-activities |
                awk '{print $3}' |
                while IFS= read -r activity; do
                    [[ "$activity" == "$cur"* ]] && printf '%s\n' "$activity"
                done
        )
    fi
}

complete -F _cdws_completions cdws
