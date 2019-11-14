#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | .bashrc                                                                 |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
       printf "[not interactive]\n"
    # exit 0
else
    if [ -x ~/.bash_functions ]; then
        . ~/.bash_functions
    fi
fi

umask 002
export PATH=$HOME/.local/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export EDITOR=vi
export GIT_AUTHOR_NAME="Waldemar Schroeer"
export GIT_COMMITTER_NAME="Waldemar Schroeer"

export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE=~/.bash_history

shopt -s histappend
shopt -s checkwinsize
shopt -q -s cdspell

case ${TERM} in
    sshd|putty)
        export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
        pacman_small
        ;;
    urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        pacman_fancy
        # export PS1="\[\e[38;5;255;48;5;53m\] \u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\] \w\$(parse_git_branch)\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\]\@\[\e[0m\[\e[38;5;140m\[\e[m\] "
        export PS1="\[\e[38;5;255;48;5;53m\] \u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\] \$(split_pwd)\$(parse_git_branch)\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\]\@\[\e[0m\[\e[38;5;140m\[\e[m\] "
        ;;
    linux|screen*)
        pacman_tiny
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
        ;;
esac

# User specific aliases and functions
# alias l='LC_ALL=C /bin/ls --color=auto --group-directories-first -lah' 2>/dev/null
alias vi='TERM=xterm /usr/bin/vim -X' 2>/dev/null
# alias l='~/.local/bin/exa -laghmuH --group-directories-first --git' 2>/dev/null
alias l='~/.local/bin/exa -laghm --group-directories-first --git' 2>/dev/null
alias ll='/bin/ls --color=auto --group-directories-first -lah | more' 2>/dev/null
alias grep='grep -i --color=auto' 2>/dev/null
alias s='su - root' 2>/dev/null
alias cp='cp -ir' 2>/dev/null
alias rm='rm -rf' 2>/dev/null
alias mkdir='mkdir -p' 2>/dev/null
alias ..='cd ..' 2>/dev/null

if [ -f ~/.motd ]; then
    /bin/cat ~/.motd
fi

