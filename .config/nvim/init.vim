" Plugins
" ====================================================
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
" Appearance
Plug 'shatur/neovim-ayu'
Plug 'junegunn/goyo.vim'

" Functionality
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion & Snips
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

" LSP Setup
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()

" Apperance
" ====================================================
set termguicolors
" Check for apperance here so there's no flickering between
" light and dark
colorscheme ayu-mirage
if exists("g:gui_vimr")
    " VimR
    set background=light
else
    " Terminal
    set background=dark
endif

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

" Fuzzy finding
set path+=**
set wildmenu
set wildignore+=**/__pycache__/**,**/.git/**
nnoremap <leader>f :find *

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

" Lua
" ====================================================
lua <<EOF
 
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = {
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    }
})

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
    cmd = {"clangd", 
        -- The `--query-driver` arguement is a whitelist; thus, adding it to
        -- the top level causes no issues when arm-none-eabi-g* isn't used.
        "--query-driver=/opt/homebrew/bin/arm-none-eabi-g*",
        "--compile-commands-dir=build"
        }
})

lsp.setup()

EOF
