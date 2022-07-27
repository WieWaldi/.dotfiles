<img src="https://raw.githubusercontent.com/WieWaldi/.dotfiles/master/img/RZ-Amper_Logo_135x135.png" align="left" width="135px" height="135px" />

### .dotfiles by WieWaldi
> *My personal set of .dotfiles for bash, Zsh, tmux, screen, Vim and even PowerShell.*

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

<br />

![screenshot_vim.png](https://raw.githubusercontent.com/WieWaldi/.dotfiles/master/img/screenshot_dotfiles.png)
## Requirements  
### Color Scheme
Don't try to run these .dotfiles through a terminal which isn't driven by Ethan
Schoonover's Solarized X Resource Fils. I can't stress this enough. Vim will
look awfull if no solarized theme is applied to the terminal. You my use my
.Xresourse file from [WieWaldi/suckless.X11](https//:github.com/WieWaldi/suckless.X11),
or directly from [Ethan Schoonover](https://github.com/altercation).
 - [Solarized](https://github.com/altercation/solarized)
 - [Solarized Colorscheme for Vim](https://github.com/altercation/vim-colors-solarized)
 - [Solarized - Precision colors for machines and people](https://github.com/solarized)
 - [Solarized Xresources](https://github.com/solarized/xresources)
 - [Solarize color theme tmux configuration](https://github.com/solarized/tmux-colors-solarized)
 - [Solarized for Gedit](https://github.com/solarized/solarized-gedit)
### Nerd Fonts
You will encounter loads of characters not being displayed correctly if you 
don't use [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) or a font with
correct glyphs patched in. The repository contains the following patched fonts.
 - FiraMono
 - Go-Mono
## Setup
You may hand pick the parts you like or simply run the setup script. It will
put everything in place. Next time you open your shell, you'll be amazed. The
setup script will create a backup folder and move existing files to it.
```
git clone https://github.com/WieWaldi/.dotfiles.git ~/.dotfiles
~/.dotfiles/setup.sh
```

## Links/URLs/Credits  
[indentLine](https://github.com/Yggdroot/indentLine) - Displaying thin vertical lines at each indentation level.  
[NERDTree](https://github.com/preservim/nerdtree) - The NERDTree is a file system explorer for the Vim editor.  
[vim-devicons](https://github.com/ryanoasis/vim-devicons) - Adds filetype glyphs (icons) to various vim plugins.  
[vim-gitgutter](https://github.com/airblade/vim-gitgutter) - A Vim plugin which shows a git diff in the sign column.  
[vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle) - numbertoggle switches to absolute line numbers.  
[vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) - An awesome automatic table creator & formatter  
[nicknisi/dotfiles](https://github.com/nicknisi/dotfiles) - Good inspiration and starting point.

## Version
The option to create releases on GitHub is pretty nice. I really do like it since it give me easy access to all the files
without git cloning the complete repository.  

Version 1.0
