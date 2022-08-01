#!/usr/bin/env zsh
#
# +----------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/03-prompt.zsh                                            |
# +----------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# |                                                                            |
# +----------------------------------------------------------------------------+

# +----- Set Prompt Symbols ---------------------------------------------------+
CURRENT_BG='NONE'
CURRENT_FG='white'

vi_mode_symbol=${vi_mode_ins_symbol}

zle -N zle-keymap-select
zle -N zle-line-finish
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

prompt_userhost () {
    
}
build_prompt_standard() {
    echo ""
}

build_prompt_enhanced() {
    echo ""
}

build_prompt_fancy() {
    prompt_usersymbol
    echo ""
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
        prompt_usersymbol
        PROMPT="%F{255}%K{53}${usersymbol}"
        PROMPT+='%n@%m'
        PROMPT+='%F{53}%K{91}'
        PROMPT+='%F{255}%K{91}${workingdir}'
        PROMPT+='%F{91}%K{140}'
        PROMPT+='${exitsymbol}'
        PROMPT+='%F{140}%k%f%k '
        RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91} %B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53}${vi_mode_symbol}%F{255} %E'
        ;;
    *)
        printf "\n\n [Oh Boy, something's wrong.]\n"
        PROMPT="> "
        ;;
esac
