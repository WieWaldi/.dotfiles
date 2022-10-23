<img src="https://raw.githubusercontent.com/WieWaldi/.dotfiles/master/img/RZ-Amper_Logo_135x135.png" align="left" width="135px" height="135px" />

### Zsh
> *Some notes about Zsh*

[![MIT Licence](https://raw.githubusercontent.com/WieWaldi/badges/master/badges/licence_mit.svg)](https://opensource.org/licenses/mit-license.php)

<br />

### Zsh dotfiles
To configure Zsh for your user’s session, you can use the following files:  
 - $ZDOTDIR/.zshenv
 - $ZDOTDIR/.zprofile
 - $ZDOTDIR/.zshrc
 - $ZDOTDIR/.zlogin
 - $ZDOTDIR/.zlogout

Zsh read these files in the following order:  
 1. `.zshenv` - Should only contain user’s environment variables.
 2. `.zprofile` - Can be used to execute commands just after logging in.
 3. `.zshrc` - Should be used for the shell configuration and for executing commands.
 4. `.zlogin` - Same purpose than .zprofile, but read just after .zshrc.
 5. `.zlogout` - Can be used to execute commands when a shell exit.
### Zsh Config Path
By default, Zsh will try to find the user’s configuration files in the $HOME
directory. You can change it by setting the environment variable `$ZDOTDIR`.

Personally, I like to have all my configuration files in $HOME/.config. To do so:
 1. I set the variable `$XDG_CONFIG_HOME` as following: `export XDG_CONFIG_HOME="$HOME/.config"`.
 2. Set the environment variable `$ZDOTDIR`: `export ZDOTDIR="$XDG_CONFIG_HOME/zsh".`
 3. I put the file `.zshrc` in the `$ZDOTDIR` directory.

Most software will use the path in `$XDG_CONFIG_HOME` to install their own config
files. As a result, you’ll have a clean `$HOME` directory. Unfortunately, the
file .zshenv needs to be in your home directory. It’s where you’ll set
`$ZDOTDIR`. Then, every file read after `.zshenv` can go into your `$ZDOTDIR
directory`.

## Links/URLs/Credits  
[riptotarial.com Getting started with zsh](https://riptutorial.com/zsh) Some Remarks  
[reddit.com A Guide to the Zsh Auto-Completion With Examples](https://www.reddit.com/r/zsh/comments/nm2vun/a_guide_to_the_zsh_autocompletion_with_examples/)  
[The Valuable Dev](https://thevaluable.dev/zsh-install-configure-mouseless/) Configuring Zsh Without Dependencies  
[flowblok's blog](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html) Shell startup scripts  
[github.com/zsh-users](https://github.com/zsh-users/zsh/blob/f9e9dce5443f323b340303596406f9d3ce11d23a/Misc/vcs_info-examples) vcs_info Examples  
[github.com/leath-dub](https://github.com/leath-dub/dotfiles/tree/master/.config/zsh) Some guys dotfiles  
[arjanvandergaag.nl](https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html) Customize your ZSH prompt with vcs_info  
