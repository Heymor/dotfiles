" GUI Vim specific options

" Apperance
" ====================================================
" no tildas
hi NonText guifg=bg

" hide and unhide TUI features function
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        " no numbers and no tildas
        set nonumber
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set number
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>
" don't show anything - use the function above
call ToggleHiddenAll()

" Editor
" ====================================================
" Turn on spellcheck
set spelllang=en_us
set spell
" setup wrapping for markdown editing
set breakindent " align the indent with previous ones
set breakindentopt=list:-1 " align with start of words, not the `-`
set linebreak " wrap only complete words
" autosave `.md` files
autocmd TextChanged,TextChangedI *.md silent update

" Notes
" ====================================================
" defualt launch path
let launch_path='~/OneDrive/WorkDocs/_Archive/2024/_Drafts/'
" create Note command for going to daily note
command! Note execute 'edit ' . launch_path . strftime('%Y-%m-%d') . '.md'

" Startup
" ====================================================
" change pwd
execute 'cd ' . launch_path
" open the note
Note
" launch Goyo
Goyo
