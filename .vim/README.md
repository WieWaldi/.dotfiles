<img src="https://raw.githubusercontent.com/WieWaldi/badges/master/img/RZ-Amper_Logo_135x135.png" align="left" width="135px" height="135px" />

### .vim directory by WieWaldi
*My personal Vim setup. A Solarized Color Theme and other colorful stuff.*  
[![MIT Licence](https://raw.githubusercontent.com/WieWaldi/badges/master/badges/licence_mit.svg)](https://opensource.org/licenses/mit-license.php)
![Maintained](https://raw.githubusercontent.com/WieWaldi/badges/master/badges/maintained_yes-green.svg)

![screenshot_vim.png](https://raw.githubusercontent.com/WieWaldi/.dotfiles/master/img/screenshot_vim.png)

## Mappings  
| Mapping     | Command                               | Description                  |
|-------------|---------------------------------------|------------------------------|
| <Esc><Esc>  | :silent! nohls<cr>                    | Remove Search Highlight      |
| J           | <PageDown>zz                          | Page Down and Center         |
| K           | <PageUP>zz                            | Page Up and Center           |
| Q           | :qa!<CR>                              | Just Exit without asking     |
| #           | :s/^/# /<CR>                          | Inser # at beginning of line |
| "           | :s/^/" /<CR>                          | Inser " at beginning of line |
| <Down>      | ddp                                   | Move line down               |
| <Up>        | ddkP                                  | Move line up                 |
| <Left>      | <C-w>h                                | Move to left window          |
| <Right>     | <C-w>l                                | Move to right window         |
| <Ctrl> h    | :tabprevious<CR>                      | Tab previous                 |
| <Ctrl> l    | :tabnext<CR>                          | Tab next                     |
| <Ctrl> j    | :bnext!<CR>                           | Buffer next                  |
| <Ctrl> k    | :bprevious!<CR>                       | Buffer previous              |
| <F2>        | :set cursorline! <CR>                 | Cursor line toggle           |
| <F3>        | :set cursorcolumn!<CR>                | Cursor column toggle         |
| <F4>        | :cal ToggleAppearance()<CR>           | Slim View - Full View        |
| <Space> b   | :Buffers<CR>                          | Buffers - fzf                |
| <Space> f   | :Files<CR>                            | Files - fzf                  |
| <Space> gf  | :GFiles<CR>                           | Git Files - fzf              |
| <Space> n   | :NERDTreeToggle<CR>                   | NerdTree                     |
| <Space> cc  | :ColorHighlight<CR>                   | ColorHighlight               |
| <Space> cs  | :cal ToggleSurround()<CR>             | Surround                     |
| <Space> cp  | :cal TogglePaste()<CR>                | Paste                        |
| <Space> ct  | :cal ToggleTab()<CR>                  | Tab                          |
| <Space> cw  | :cal ToggleWrap()<CR>                 | Wrap lines                   |
| <Space> cf  | <cmd>.!figlet -f small<cr>            | Replace line with Figlet     |
| <Space> q   | :bp<cr>:bd #<cr>                      | Buffer Close                 |
| <Space> Q   | :bp<cr>:bd #!<cr>                     | Buffer Close without saving  |
| <Space> mm  | :Minimap<cr>                          | Minimap                      |
| <Space> mr  | :MinimapRefresh<cr>                   | Minimap refresh              |
| <Space> mc  | :MinimapClose<cr>                     | Minimap close                |
| <Space> vim | :e ~/.vim/vimrc<cr>                   | Edit vimrc                   |
| <Space> hc  | :call popup_clear()<cr>               | Close all PopUps             |
| <Space> hh  | :call MyExtShowFile('~/.vim/map')<cr> | You got it already           |
| <Space> ps  | :CopilotChatSubmit<cr>                | Submit your chat to CoPilot  |
| <Space> pc  | :CopilotChatToggle<cr>                | Toggle CoPilot Chat Window   |
| <Space> tm  | :TableModeToggle<cr> >                | Toggle Table Mode            |

#### Links/URLs/Credits  
The following projects are part of this repository.  
 - [indentLine](https://github.com/Yggdroot/indentLine) - Displaying thin vertical lines at each indentation level.  
 - [NERDTree](https://github.com/preservim/nerdtree) - The NERDTree is a file system explorer for the Vim editor.  
 - [vim-devicons](https://github.com/ryanoasis/vim-devicons) - Adds filetype glyphs (icons) to various vim plugins.  
 - [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - A Vim plugin which shows a git diff in the sign column.  
 - [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle) - numbertoggle switches to absolute line numbers.  
 - [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) - An awesome automatic table creator & formatter  
 - [minimap.vim](https://github.com/wfxr/minimap.vim) - Blazing fast minimap for vim  
 - [code-minimap](https://github.com/wfxr/code-minimap) - This tool is for generating text minimaps  
 - [copilot.vim](https://github.com/github/copilot.vim) - GitHub Copilot plugin for Vim, Neovim, and Visual Studio Code's Vim extension.
 - [Copilot Chat for Vim](https://github.com/DanBradbury/copilot-chat.vim) - Chat with GitHub Copilot in Vim, powered by OpenAI's GPT-4.
