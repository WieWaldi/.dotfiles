" +-------------------------------------------------------------------------+
" | .vimrc                                                                  |
" +-------------------------------------------------------------------------+
" | Copyright © 2020 Waldemar Schroeer                                      |
" |                  waldemar.schroeer(at)rz-amper.de                       |
" +-------------------------------------------------------------------------+
"
"======== Color Theme =========================================================
highlight TabLineFill ctermfg=53 ctermbg=53
highlight TabLine ctermfg=133 ctermbg=53
highlight TabLineSel ctermfg=255 ctermbg=53
highlight LineNr ctermfg=133 ctermbg=53    
highlight CursorLine cterm=none term=none
highlight CursorLine guibg=#303000 ctermbg=255
highlight ColorColumn ctermbg=254

"======== Default Settings ====================================================
setlocal cm=blowfish2                       " Sets encryption method to blowfish2
syntax on                                   " Sets syntax highlighting on
set path=.,,**                              " Set path to current directory
set undodir=~/.vim/undodir                  " Undo directory
set undofile                                " Create undo file
set number                                  " Show relative line numbers
set cursorline                              " Highlight current line
set smartindent                             " Do smart autoindenting when starting a new line
set backspace=2                             " Same as :set backspace=indent,eol,start
set incsearch                               " Find the next match as we type the search
set ignorecase                              " Find case insesitive
set nohlsearch                              " No hilight of search string
set noswapfile                              " Don't create swap files
set backup                                  " Don't create backup files
set ruler                                   " Show ruler on the left side
set colorcolumn=81                          " Show color column on the right side
set t_Co=256                                " Tell the term has 256 colors
set list                                    " List mode
set listchars=eol:¬,tab:▸-                  " Strings to use in list mode
" set t_ti= t_te=                           " Don't reset screen
set nowrap                                  " Dont wrap lines
set scrolloff=25                            " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=7                         " The minimal number of screen columns to keep to the left
set sidescroll=1                            " Scroll one character at a time
set showtabline=2                           " Always show tab line

"======== Default Indent Settings =============================================
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
execute "set tabstop=".my_tab
set expandtab

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

"======== Autocommands ========================================================
autocmd BufWritePost meeting*.adoc !./meeting.sh <afile>
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

"======== Custom Mappings =====================================================
nnoremap <down> ddp
nnoremap <up> ddkP
nnoremap <F2> :set cursorline! <CR>
nnoremap <F3> :set cursorcolumn!<CR>
nnoremap <leader>t :tabfind

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

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
