# add homebrew if on MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    export DISPLAY=:0
    export PATH=$PATH:/opt/homebrew/bin
elif [[ "$OSTYPE" == "linux"* ]]; then
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi
fi

# add in custom scripts
export PATH=$PATH:$HOME/bin

# add in aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

