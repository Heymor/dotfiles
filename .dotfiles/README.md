# Dotfiles
I used this [Atlassian article](https://www.atlassian.com/git/tutorials/dotfiles) to set this up.

I use Neovim, Alacritty, and Tmux - I've kept everything simple and minimal.

## Dependencies
- [vim-plug](https://github.com/junegunn/vim-plug)
- [Starship](https://starship.rs/)

## Setting up the global `.gitignore`
```
git config --global core.excludesfile ~/.gitignore_global
```
