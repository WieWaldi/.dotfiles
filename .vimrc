"==============================================================================
"======== Color Theme =========================================================
" color solarized_flat_light
" color solarized_flat_dark

"======== Default Settings ====================================================
syntax on
filetype indent plugin off
filetype indent off
set backspace=2
set incsearch                               "find the next match as we type the search
set nohlsearch                              "no hilight of search string
set ruler
set colorcolumn=81
highlight ColorColumn ctermbg=254
set t_Co=256                                "tell the term has 256 colors

"======== Default Indent Settings =============================================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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
