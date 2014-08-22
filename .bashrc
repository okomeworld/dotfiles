# git completion
source ~/.git-prompt.sh
source ~/.git-completion.bash

# 環境変数
export HOME=/home/unipla/users/kawakatsu
export EDITOR=vim
export PAGER=less

# prompt
export PS1="[\u@\h \w$(__git_ps1)]$ "

# alias
alias vi="vim"
alias ls="ls -AG"
