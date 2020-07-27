" Plugins
filetype plugin indent on
call plug#begin('~/.local/share/nvim/plugged')
" Apperance
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Functionality
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'neoclide/coc.nvim', {'branch' : 'release' }
Plug 'zhou13/vim-easyescape'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
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
let mapleader = " "
" Removing trailing whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


" FZF
" ====================================================
" FZF appearance
let g:fzf_colors = {
            \ 'bg+': ['bg', 'Normal'],
            \ 'pointer' : ['fg', 'Statement']}
" Disable preview window
let g:fzf_preview_window = ''
" Floating FZF window
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.5 } }
" <leader>f for FZF
map <silent> <leader>f :FZF <CR>
map <silent> <leader>b :Buffers <CR>


" Easy Escape
" ====================================================
" JK as <ESC>
let g:easyescape_chars = { "j" : 1, "k" : 1}
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>


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


" CoC
" ====================================================
" TAB completion for coc
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
" Changing the upadate time for coc.nvim
set updatetime=200
" From the README
set cmdheight=2
" Goto chode navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Airline
" ====================================================
" Load in airline customization
so ~/.config/nvim/statusline.vim
