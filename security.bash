hashchain() {
    if (( $# < 3 )); then
        printf 'Usage: hashchain A B C [text ...]\n' >&2
        return 2
    fi

    local a="$1" b="$2" c="$3"
    shift 3

    local input hash_a hash_b hash_c output algo

    for algo in "$a" "$b" "$c"; do
        command -v "$algo" >/dev/null 2>&1 || {
            printf 'hashchain: command not found: %s\n' "$algo" >&2
            return 127
        }
    done

    if (( $# > 0 )); then
        input="$*"
    else
        input=$(cat) || return 1
    fi

    output=$(printf '%s' "$input" | "$a") || return 1
    hash_a=${output%%[[:space:]]*}

    output=$(printf '%s' "$input" | "$b") || return 1
    hash_b=${output%%[[:space:]]*}

    output=$(printf '%s' "${hash_a}${hash_b}" | "$c") || return 1
    hash_c=${output%%[[:space:]]*}

    printf '%s' "$hash_c"
}

_hashchain_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local cmd

    (( COMP_CWORD >= 1 && COMP_CWORD <= 3 )) || return

    COMPREPLY=()

    while IFS= read -r cmd; do
        [[ "$cmd" == "$cur"* ]] || continue
        [[ "$cmd" =~ ^[[:alnum:]_-]*sum$ ]] || continue
        [[ -n "$(type -P "$cmd")" ]] || continue

        COMPREPLY+=("$cmd")
    done < <(compgen -c | sort -u)
}

complete -F _hashchain_complete hashchain