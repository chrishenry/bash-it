#
# Aliases
alias ll='ls -al'
alias la='ls -al'
alias s='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l chris -i ~/.ssh/id_rsa_ssh'

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