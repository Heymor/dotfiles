if [ -z "$INIT_BASH_SH_" ]; then
    INIT_BASH_SH_=yes

    # source aliases
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    PS1='\h:\W \u\$ '
fi
