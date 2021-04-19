" Plugins
" ====================================================
filetype plugin indent on

" Make sure that vim-plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
" Apperance
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Functionality
Plug 'zhou13/vim-easyescape'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Apperance
" ====================================================
set termguicolors
set background=dark
set t_Co=256
let ayucolor="mirage"
colorscheme ayu
let g:airline_theme="ayu_mirage"
let g:airline_powerline_fonts=1

" Editor
" ====================================================
set nocp
set encoding=utf-8
syntax on
set tabstop=4 shiftwidth=4 expandtab smarttab
set hidden
set nu rnu
let mapleader = ","
" Removing trailing whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" Easy Escape
" ====================================================
" jj as <ESC>
let g:easyescape_chars = { "j" : 2 }
let g:easyescape_timeout = 200
cnoremap jj <ESC>

" NERDTree
" ====================================================
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
            \ b:NERDTree.isTabTree()) | q | endif
" <leader> ne for NERDTree
map <silent> <leader>ne :NERDTreeToggle<CR>
" Show the sign column always, unless in a nerdtree buffer
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no
" Embrace the stability
let g:NERDTreeWinPos = "right"

" vim-gitgutter
" ====================================================
set updatetime=250

" Airline
" ====================================================
" Load in airline customization
so ~/.config/nvim/statusline.vim
