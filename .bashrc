#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | .bashrc                                                                 |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

if [[ $- == *i* ]]; then
    # Test for necessary files and bail out if importent things are missing.
    if [[ -f ~/.bash_functions ]]; then
        . ~/.bash_functions
        umask 002
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib64
        export PATH=$HOME/.local/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
        export EDITOR=vi
        export HISTSIZE=1000
        export HISTFILESIZE=2000
        export HISTFILE=~/.bash_history
        export HISTTIMEFORMAT="[%F %T] "
        export GIT_AUTHOR_NAME="Waldemar Schroeer"
        export GIT_COMMITTER_NAME="Waldemar Schroeer"
        shopt -s histappend
        shopt -s checkwinsize
        shopt -q -s cdspell

        case ${TERM} in
            sshd|putty)
                # pacman_small
                export PROMPT_COMMAND=prompt_command_tiny
                ;;
            urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
                # pacman_fancy
                export PROMPT_COMMAND=prompt_command_fancy
                ;;
            linux|screen*)
                # pacman_tiny
                printf "\n\n [Oh Boy, get on a graphical shell!]\n"
                export PROMPT_COMMAND=prompt_command_tiny
                ;;
        esac

        # User specific aliases and functions
        alias vi='TERM=xterm /usr/bin/vim -X' 2>/dev/null
        alias l='~/.local/bin/exa -laghm --group-directories-first --git' 2>/dev/null
        alias ll='LC_ALL=C /bin/ls --color=auto --group-directories-first -lah' 2>/dev/null
        alias grep='grep -i --color=auto' 2>/dev/null
        alias s='su - root' 2>/dev/null
        alias cp='cp -ir' 2>/dev/null
        alias rm='rm -rf' 2>/dev/null
        alias mkdir='mkdir -p' 2>/dev/null
        alias ..='cd ..' 2>/dev/null
        alias ...='cd ../..' 2>/dev/null

        if [[ -f ~/.motd ]]; then
            /bin/cat ~/.motd
        fi

    else
        /bin/printf "Go get me my goods! I'm missing my functions\n"
        /bin/printf "I rely on ~/.bash_functions. Don't expect me to work correctly.\n\n"
    fi
fi
