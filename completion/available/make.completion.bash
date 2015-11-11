#!/usr/bin/env bash

# Use cache files for make tasks or not.
# If set to "false" command "make list" will be executed every time.
export MAKE_COMPLETION_CACHE_TASKS=true

# File name where tasks cache will be stored (in current dir).
export MAKE_COMPLETION_CACHED_TASKS_FILENAME=".make_tasks~"


# Set command to get time of last file modification as seconds since Epoch
case `uname` in
    Darwin|FreeBSD)
        __MAKE_COMPLETION_MTIME_COMMAND="stat -f '%m'"
        ;;
    *)
        __MAKE_COMPLETION_MTIME_COMMAND="stat -c '%Y'"
        ;;
esac


#
# Get time of last make cache file modification as seconds since Epoch
#
function __make_chache_mtime() {
    ${__MAKE_COMPLETION_MTIME_COMMAND} \
        $MAKE_COMPLETION_CACHED_TASKS_FILENAME | xargs -n 1 expr
}


#
# Get time of last Makefile file/module modification as seconds since Epoch
#
function __make_makefile_mtime() {
    local f="Makefile"
    if [[ -e "$f" ]]; then
        ${__MAKE_COMPLETION_MTIME_COMMAND} "$f" | xargs -n 1 expr
    else
        # Suppose that it's a Makefile dir
        find $f/Makefile -exec ${__MAKE_COMPLETION_MTIME_COMMAND} {} + \
            | xargs -n 1 expr | sort -n -r | head -1
    fi
}

#
# Completion for "make" command
#
function __make_completion() {
    # Return if "make" command doesn't exists
    [[ -e `which make 2> /dev/null` ]] || return 0

    # Variables to hold the current word and possible matches
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local opts=()

    # Generate possible matches and store them in variable "opts"
    case "${cur}" in
        -*)
            if [[ -z "${__make_completion_LONG_OPT}" ]]; then
                export __make_completion_LONG_OPT=$(
                    make list | sort -u)
            fi
            opts="${__make_completion_LONG_OPT}"
            ;;

        # Completion for short options is not nessary.
        # It's left here just for history.
        # -*)
        #     if [[ -z "${__make_completion_SHORT_OPT}" ]]; then
        #         export __make_completion_SHORT_OPT=$(
        #             make --help | egrep -o "^ +\-[A-Za-z_\]" | sort -u)
        #     fi
        #     opts="${__make_completion_SHORT_OPT}"
        #     ;;

        *)
            # If "Makefile"
            local f="Makefile"
            if [[ -e "$f" ]]; then
                # Build a list of the available tasks
                if $MAKE_COMPLETION_CACHE_TASKS; then
                    # If use cache
                    if [[ ! -s ${MAKE_COMPLETION_CACHED_TASKS_FILENAME} ||
                          $(__make_makefile_mtime) -gt $(__make_chache_mtime) ]]; then
                        make list | grep -v "Makefile" > ${MAKE_COMPLETION_CACHED_TASKS_FILENAME} \
                            2> /dev/null
                    fi
                    opts=$(cat ${MAKE_COMPLETION_CACHED_TASKS_FILENAME})
                else
                    # Without cache
                    opts=$(make list 2> /dev/null)
                fi
            fi
            ;;
    esac

    # Set possible completions
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -o default -o nospace -F __make_completion make
