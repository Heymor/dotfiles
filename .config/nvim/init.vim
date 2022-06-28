" Plugins
" ====================================================
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
" Appearance
Plug 'shatur/neovim-ayu'
Plug 'nvim-lualine/lualine.nvim'

" Functionality
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" Completion
Plug 'ludovicchabant/vim-gutentags'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

" OS detection
" ====================================================
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" Apperance
" ====================================================
set termguicolors
set background=dark
colorscheme ayu-mirage
let g:airline_powerline_fonts=1
let g:airline_theme="ayu_mirage"

" Editor
" ====================================================
set nocp
set encoding=utf-8
syntax on
set tabstop=4 shiftwidth=4 expandtab smarttab
set hidden
set number
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

" Quickly change buffers
nnoremap <leader><leader> :ls<CR>:b<Space>
nnoremap <leader><tab> :b#<CR>

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

" vim-mucomplete
" ====================================================
let g:mucomplete#enable_auto_at_startup=1
let g:mucomplete#completion_delay=1
set completeopt+=menuone,noselect
set completeopt-=preview
set shortmess+=c

" gutentags
" ====================================================
" Macbook executable is not where gutentags exepects it
if g:os == "Darwin"
    let g:gutentags_ctags_executable='/opt/homebrew/bin/ctags'
endif

" Lualine
" ====================================================
lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'ayu',
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
