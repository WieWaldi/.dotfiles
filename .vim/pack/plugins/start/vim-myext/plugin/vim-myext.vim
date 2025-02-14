" +----------------------------------------------------------------------------+
" | .vim/pack/plugins/start/vim-myext/plugin/vim-myext.vim                     |
" +----------------------------------------------------------------------------+
" | Copyright © 2024 Waldemar Schroeer                                         |
" |                  waldemar.schroeer(at)rz-amper.de                          |
" +----------------------------------------------------------------------------+

"======== Show content of a file in a PopUp ===================================
function! MyExtShowFile(file)
    try
        let file_content = readfile(glob(a:file))
    catch
        echomsg 'Fuck You! File not found.'
        return
    endtry
    let options = {
                \ 'title': 'Press [X] or [Q] to close',
                \ 'pos': 'center',
                \ 'minwidth': 120,
                \ 'maxwidth': 120,
                \ 'maxheight': 40,
                \ 'minheight': 40,
                \ 'wrap': v:false,
                \ 'padding': [1, 2, 1, 2],
                \ 'scrollbar': v:true,
                \ 'border': [],
                \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                \ 'borderhighlight': ['PMenuSel'],
                \ 'highlight': 'MyExtShowFile',
                \ 'filter': 'MyExtFilter',
                \ }
    " call popup_create(g:file_content, g:options)
    let winid = popup_create(file_content, options)
endfunction

function! MyExtFilter(winid, key)
    if a:key == "\<F2>"
        echomsg "do something"
    return 1
    endif
    if a:key == 'x' || a:key == 'q'
        call popup_close(a:winid)
        return 1
    endif
    return 0
endfunction

"======== Show Message at Cursor ==============================================
function! MyExtMsgCur(msg)
    let options = {
                \ 'padding': [1, 2, 1, 2],
                \ 'border': [],
                \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                \ 'borderhighlight': ['PMenuSel'],
                \ 'highlight': 'MyExtShowFile',
                \ }
    call popup_atcursor(a:msg, options)
endfunction

"======== Toggle Appearance ===================================================
let g:myAppearance="full"
function! ToggleAppearance()
    if g:myAppearance=="full"
        let g:myAppearance="slim"
        set list!
        set relativenumber! number! ruler!
        set conceallevel=0
        redraw!
        call MyExtMsgCur('Slim View.')
    else
        let g:myAppearance="full"
        set list!
        set relativenumber! number! ruler!
        set conceallevel=2
        redraw!
        call MyExtMsgCur('Full View.')
    endif
endfunction

"======== Toggle Wrap =========================================================
let g:myWrap="nowrap"
function! ToggleWrap()
    if g:myWrap=="nowrap"
        let g:myWrap="wrap"
        set wrap linebreak nolist
        set textwidth=80
        call MyExtMsgCur('I''m going to wrap lines.')
    else
        let g:myWrap="nowrap"
        set wrap! linebreak! nolist!
        set textwidth=0
        call MyExtMsgCur('I''m not going to wrap lines.')
    endif
endfunction

"======== Toggle Paste ========================================================
let g:myPaste="nopaste"
function! TogglePaste()
    if g:myPaste=="nopaste"
        let g:myPaste="paste"
        set paste
        call MyExtMsgCur('Paste Now!.')
    else
        let g:myPaste="nopaste"
        set nopaste
        call MyExtMsgCur('Don''t paste now!.')
    endif
endfunction

"======== Toggle Surround ======================================================
let g:mySurround="nosurround"
function! ToggleSurround()
    if g:mySurround=="surround"
        let g:mySurround="nosurround"
        execute 'iunmap "'
        execute 'iunmap ('
        execute 'iunmap ['
        execute 'iunmap {'
        execute 'iunmap {<CR>'
        execute 'iunmap {;<CR>'
        execute 'iunmap <expr> )'
        call MyExtMsgCur('I''m not surrounding from now on.')
    else
        let g:mySurround="surround"
        execute 'inoremap " ""<left>'
        execute 'inoremap ( ()<left>'
        execute 'inoremap [ []<left>'
        execute 'inoremap { {}<left>'
        execute 'inoremap {<CR> {<CR>}<ESC>O'
        execute 'inoremap {;<CR> {<CR>};<ESC>O'
        execute 'inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"'
        call MyExtMsgCur('I''m surrounding from now on.')
    endif
endfunction

"======== Toggle Soft Tabs ====================================================
let g:my_tab=4
execute "set shiftwidth=".g:my_tab
execute "set softtabstop=".g:my_tab
execute "set tabstop=".g:my_tab
set expandtab

function! ToggleTab()
    if &expandtab
        execute "set shiftwidth=".g:my_tab
        execute "set softtabstop=0"
        set noexpandtab
        call MyExtMsgCur('I''m not expanding Tabs from now on.')
    else
        execute "set shiftwidth=".g:my_tab
        execute "set softtabstop=".g:my_tab
        set expandtab
        call MyExtMsgCur('I''m expanding Tabs from now on.')
    endif
endfunction

"======== EOF =================================================================
