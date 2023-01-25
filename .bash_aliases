alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rmi=rm -i

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

PATH=$PATH:$HOME/bin
