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
	export PATH=~/bin:$PATH
fi

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# direnv
if type direnv > /dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi
