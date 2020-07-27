# Change the prompt
# Simple prompt (if no Starship)
# function fish_prompt
#     set_color brblue --bold
#     printf '[%s]> ' (prompt_pwd)
#     set_color normal
# end

# Make sure LS doesn't color directories
set -g LS_COLORS 'ow=1;34'
export LS_COLORS

# Change to home directory
cd ~

# Dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vimdiff='nvim -d'

# start starship
starship init fish | source
