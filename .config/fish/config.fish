# Change the prompt
function fish_prompt
    set_color brblue --bold
    printf '[%s]> ' (prompt_pwd)  
    set_color normal
end

# Make sure LS doesn't color directories
set -g LS_COLORS 'ow=1;34'
export LS_COLORS

# Change to home directory
cd ~

# Dotfiles management
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
