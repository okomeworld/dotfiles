# 環境変数
export EDITOR=vim
export PAGER=less
export HOME="$(cd $(dirname $(echo $BASH_SOURCE || echo $0)) && pwd)"

# git completion
source "${HOME}/.git-prompt.sh"
source "${HOME}/.git-completion.bash"

# prompt
export PS1='[\u@\h \w$(__git_ps1)]\n$ '

# alias
alias vi="vim"

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -d ~/bin ]; then
	export PATH=$PATH:~/bin
fi
