#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/03-prompt.zsh                                         |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# |                                                                         |
# +-------------------------------------------------------------------------+

# Git Info for RPROMPT
prompt_prefix=${prompt_prefix:-''}
vi_mode_ins_symbol=${vi_mode_ins_symbol:-'--INSERT--'}
vi_mode_nrm_symbol=${vi_mode_nrm_symbol:-'--NORMAL--'}
vi_mode_vis_symbol=${vi_mode_vis_symbol:-'--VISUAL--'}
vi_mode_symbol="${vi_mode_ins_sysbol}"
zle-keymap-select() {
    if [ "${KEYMAP}" = 'vicmd' ]; then
        vi_mode_symbol="${vi_mode_nrm_symbol}"
    else
        vi_mode_symbol="${vi_mode_ins_symbol}"
    fi
    zle reset-prompt
}
zle -N zle-keymap-select
zle-line-finish() {
    vi_mode_symbol="${vi_mode_ins_symbol}"
}
zle -N zle-keymap-select

TRAPIN() {
    vi_mode_symbol="${vi_mode_ins_symbol}"
    return $(( 128 + $1 ))
}

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%b %F{green}%m%u%c"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='?'
  fi
}

case ${TERM} in
    sshd|putty)
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    linux|screen*)
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    urxvt|st|st-256color|tmux*|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        precmd() {
            exitcode="$?"
            split=3
            workingdir=" $(pwd | sed 's@'"$HOME"'@~@')"
            
            if [[ ${exitcode} -eq 0 ]]; then
                exitsymbol=" "
            else
                exitsymbol=" "
            fi
        
            if [[ $(id -u) = 0 ]]; then
                usersymbol=" "
            else
                usersymbol=" "
            fi
        
            W=${workingdir}
            if [[ $(echo ${W} | grep -o '/' | wc -l) -gt ${split} ]]; then
                workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
            fi
        
            PROMPT="%F{255}%K{53}${usersymbol}"
            PROMPT+="%n@%m"
            PROMPT+="%F{53}%K{91}"
            PROMPT+="%F{255}%K{91}${workingdir}"
            PROMPT+="%F{91}%K{140}"
            PROMPT+="${exitsymbol}"
            PROMPT+="%F{140}%k%f%k "
            vcs_info
            RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91}%B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53}%(?.%F{green}$vi_mode_symbol.%F{red}vi_mode_symbol)  %E'
        }
        ;;
    *)
        printf "\n\n [Oh Boy, something's wrong.]\n"
        PROMPT="> "
        ;;
esac
