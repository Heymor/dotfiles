if [ -z "$BASH_ALIASES_SH_" ]; then
    BASH_ALIASES_SH_=yes

    # for dofiles config
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    # for conda setup
    if [ -d ~/miniconda3 ]; then
        alias useconda="eval \"\$(~/miniconda3/bin/conda shell.bash hook)\""
    fi

    if [ -f ~/.bash_aliases_private ]; then
        . ~/.bash_aliases_private
    fi
fi
