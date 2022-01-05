#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | .bash_functions                                                         |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

function prompt_command_fancy() {
    local exitcode="$?"
    local split=4
    local workingdir=" $(pwd | sed 's@'"$HOME"'@~@')"
    local git=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')

    if [[ ${exitcode} -eq 0 ]]; then
        local exitsymbol=" "
    else
        local exitsymbol=" "
    fi

    if [[ $(id -u) = 0 ]]; then
        local usersymbol=" "
    else
        local usersymbol=" "
    fi

    W=${workingdir}
    if [[ $(echo ${W} | grep -o '/' | wc -l) -gt ${split} ]]; then
        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
    fi

    PS1="\[\e[38;5;255;48;5;53m\]${usersymbol}\u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\]${workingdir}${git}\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\] \A${exitsymbol}\[\e[0m\[\e[38;5;140m\[\e[m\]"
    # PS1="${exitsymbol}${usersymbol} ${workingdir} ${git}"
}

function prompt_command_tiny() {
    local exitcode="$?"
    local split=2
    local workingdir="$(pwd | sed 's@'"$HOME"'@~@')"
    local git="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
    W=${workingdir}
    if [[ $(echo ${W} | grep -o '/' | wc -l) -gt ${split} ]]; then
        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
    fi
    PS1="\n┌[\u@\h]──[${workingdir}${git}]──[\@]\n└────╼ "

}


