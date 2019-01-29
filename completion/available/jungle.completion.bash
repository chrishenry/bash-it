_jungle_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
[[ -x "$(which jungle)" ]] && eval "$(_JUNGLE_COMPLETE=source jungle)"
    return 0
}

complete -F _jungle_completion -o default jungle;
