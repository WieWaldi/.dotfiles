#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/04-alias.zsh                                          |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# |                                                                         |
# +-------------------------------------------------------------------------+

alias vi='TERM=xterm /usr/bin/vim -X'
alias l='exa -lghm --icons --group-directories-first --git'
alias ll='exa -laghm --icons --group-directories-first --git'
alias ls='LC_ALL=C /bin/ls --color=auto --group-directories-first -lah'
alias grep='grep -i --color=auto'
alias s='su - root'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
