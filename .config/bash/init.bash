if [ -z "$INIT_BASH_SH_" ]; then
    INIT_BASH_SH_=yes

    # source aliases
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    PS1='\h:\W \u\$ '

    # change history defaults
    # expand history size
    export HISTFILESIZE=10000
    export HISTSIZE=500
    # dont save duplicates
    export HISTCONTROL=ignoreboth:erasedups
    # append to history
    shopt -s histappend
fi
