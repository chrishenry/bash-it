#
# Aliases
alias ll='ls -al'
alias la='ls -al'

#
# Git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gcav='git commit -av'
alias gca='git commit -a'
alias gs='git status'
alias gcpp='gco master && gpp'

#
# Bundler aliases
alias bx='bundle exec '
alias bek='bundle exec kitchen '
alias biv='bundle install --path .vendor'

#
# Prettify JSON
alias pjson='python -m json.tool'

#
# Rando
alias path='echo $PATH | tr ":" "\n" | sort | uniq'

#
# Gitchangelog
alias gcrb='git status -b -s | sed -e "s/## //"'

#
# SSH Aliases
alias s='sretry'
alias fingerprint='ssh-keygen -l -E md5 -f'

#
# Python webserver
alias serve='python -m SimpleHTTPServer 8000'
