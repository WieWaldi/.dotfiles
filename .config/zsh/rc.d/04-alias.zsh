#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/04-alias.zsh                                          |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# |                                                                         |
# +-------------------------------------------------------------------------+

if command -v exa &> /dev/null; then
    alias l='exa -lghm --icons --group-directories-first --git'
    alias ll='exa -laghm --icons --group-directories-first --git'
else
    alias l='LC_ALL=C ls --color=auto --group-directories-first -lh'
    alias ll='LC_ALL=C ls --color=auto --group-directories-first -lah'
fi

alias gits='git status'
alias gitm='git status && git commit -m "Minor changes" && git push'
alias gitp='git pull'
alias vi='TERM=xterm vim -X'
alias grep='grep -i --color=auto'
alias s='su - root'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
