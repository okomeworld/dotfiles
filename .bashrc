# 環境変数
export HOME=/home/unipla/users/kawakatsu
export EDITOR=vim
export PAGER=less

# git completion
source ~/.git-prompt.sh
source ~/.git-completion.bash

# prompt
export PS1="[\u@\h \w$(__git_ps1)]\n$ "

# alias
alias vi="vim"
alias ls="ls -AG"
