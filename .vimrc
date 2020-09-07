" +-------------------------------------------------------------------------+
" | .vimrc                                                                  |
" +-------------------------------------------------------------------------+
" | Copyright © 2020 Waldemar Schroeer                                      |
" |                  waldemar.schroeer(at)rz-amper.de                       |
" +-------------------------------------------------------------------------+

"======== Color Theme =========================================================
" color solarized_flat_light
" color solarized_flat_dark

" set cursorline
" set cursorcolumn
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=255

"======== Default Settings ====================================================
syntax on
filetype indent plugin off
filetype indent off
set backspace=2
set incsearch                               "find the next match as we type the search
set nohlsearch                              "no hilight of search string
set noswapfile
set ruler
set colorcolumn=81
set t_Co=256                                "tell the term has 256 colors
set list
set listchars=eol:¬,tab:▸-
set t_ti= t_te=
highlight ColorColumn ctermbg=254

"======== Default Indent Settings =============================================
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
execute "set tabstop=".my_tab
set expandtab
" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=0"
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
no T  mz:execute TabToggle()<CR>'z

"======== Vertical/Horizontal scroll off settings =============================
set nowrap                                  "dont wrap lines
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"======== Autocommands ========================================================
autocmd BufWritePost meeting*.adoc !./meeting.sh <afile>

"======== Line Numbers ========================================================
set number                                  "show relative line numbers
highlight LineNr ctermfg=133 ctermbg=53

"======== Custom Mappings =====================================================
no <down> ddp
no <up> ddkP
no H :set cursorline! cursorcolumn!<CR>

nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"======== Status Line =========================================================
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%1*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%7*                                     " Separator 
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=%8*                                     " Separator 
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%9*                                     " Separator 
set statusline+=%=                                       " Right Side
set statusline+=%9*                                     " Separator 
set statusline+=%8*\ col:\ %02v\                         " Colomn number
set statusline+=%8*                                     " Separator 
set statusline+=%2*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%7*                                     " Separator 
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\  " The current mode

highlight statusline ctermfg=255 ctermbg=53
highlight User0 ctermfg=255 ctermbg=53
highlight User1 ctermfg=255 ctermbg=53
highlight User2 ctermfg=255 ctermbg=91
highlight User7 ctermfg=53 ctermbg=91
highlight User8 ctermfg=91 ctermbg=140
highlight User9 ctermfg=140 ctermbg=15
