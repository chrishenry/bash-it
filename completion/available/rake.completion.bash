#!/usr/bin/env bash
# Bash completion support for Rake, Ruby Make.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    if [ -f Rakefile ]; then
        recent=`ls -t .rake_tasks~ Rakefile **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
        fi
        COMPREPLY=($(compgen -c -W "`cat .rake_tasks~`" -- ${COMP_WORDS[COMP_CWORD]} | cut -d "[" -f 1))
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake
