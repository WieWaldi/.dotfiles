#!/usr/bin/env zsh
#
# +----------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/04-alias.zsh                                             |
# +----------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# |                                                                            |
# +----------------------------------------------------------------------------+

# +----- Aliases --------------------------------------------------------------+
case $_os in
    Linux)
        if command -v exa &> /dev/null; then
            alias l='exa -lghm --icons --group-directories-first --git'
            alias ll='exa -laghm --icons --group-directories-first --git'
        else
            alias l='LC_ALL=C ls --color=auto --group-directories-first -lh'
            alias ll='LC_ALL=C ls --color=auto --group-directories-first -lah'
        fi
        if command -v bat &> /dev/null; then
            alias cat='bat'
        fi
        ;;
    Darwin)
        echo "I don't really care about macOS."
        ;;
    SunOS)
        if [[ -f /opt/csw/bin/gls ]]; then                                      # On Solaris, the default ls is very old and lacks some features, so we use GNU ls from CSW instead, if available.
            alias ll='gls -lghm --color=auto --group-directories-first'
        else
            alias ll='ls -lghm'
        fi
        if [[ -f /opt/csw/bin/ggrep ]]; then                                    # On Solaris, the default grep is very old and lacks some features, so we use GNU grep from CSW instead, if available.
            alias grep='/opt/csw/bin/ggrep -i --color=auto'
        else
            alias grep='grep -i'
        fi
        if [[ -f /opt/csw/bin/gsed ]]; then                                     # On Solaris, the default sed is very old and lacks some features, so we use GNU sed from CSW instead, if available.  
            alias sed='/opt/csw/bin/gsed'
        else
            alias sed='sed'
        fi
        if [[ -f /opt/csw/bin/gawk ]]; then                                     # On Solaris, the default awk is very old and lacks some features, so we use GNU awk from CSW instead, if available.
            alias awk='/opt/csw/bin/gawk'
        else
            alias awk='awk'
        fi
        ;;
    FreeBSD)
        ;;
    *)
        ;;
esac


alias gits='git status'
alias gitm='git status && git commit -m "Minor changes" && git push'
alias gitp='git pull'
alias gitdiff='git diff --no-ext-diff -w "$@" | vim -R –'
alias vi='TERM=xterm vim -X'
alias s='su - root'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
