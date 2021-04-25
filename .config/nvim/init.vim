" Plugins
" ====================================================
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
" Appearance
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Functionality
Plug 'zhou13/vim-easyescape'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'ludovicchabant/vim-gutentags'
Plug 'lifepillar/vim-mucomplete'
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
" GitGutter go burrr
set updatetime=200
" Only enable the mouse in normal and visual modes
set mouse=nv
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

" FZF
" ====================================================
" Empty value to disable preview window altogether
let g:fzf_preview_window = []
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
" FZF expects tags in the home directory of project, so don't use
" vim-gutentags's cache dir
nnoremap <silent> <leader>t :Tags<CR>

let g:fzf_action = {
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" Fix the colors in the FZF prompt
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" vim-μcomplete
" ====================================================
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
set completeopt+=menuone,noselect
set completeopt-=preview
set shortmess+=c

" Airline
" ====================================================
" Load in airline customization
so ~/.config/nvim/statusline.vim
