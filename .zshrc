# +-------------------------------------------------------------------------+
# | ~/.zshrc                                                                |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

# Check for alias file and source it.
if [[ -f ${HOME}/.alias ]]; then
    source ${HOME}/.alias
else
    echo "Could not find ${HOME}/.alias"
fi

# Auto/Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/wiewaldi/.zshrc'
zmodload zsh/complist
zmodload zsh/system
compinit
_comp_options+=(globdots)

# Git Info for RPROMPT
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

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify

# Other stuff
setopt prompt_subst
unsetopt beep
bindkey -e

# Different PROMPT for different terminal
case ${TERM} in
    sshd|putty)
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    linux|screen*)
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        printf "Fuck yeah!\n"
        precmd() {
            exitcode="$?"
            split=3
            workingdir=" $(/bin/pwd | /bin/sed 's@'"$HOME"'@~@')"
            
            if [[ ${exitcode} -eq 0 ]]; then
                exitsymbol=" "
            else
                exitsymbol=" "
            fi
        
            if [[ $(/bin/id -u) = 0 ]]; then
                usersymbol=" "
            else
                usersymbol=" "
            fi
        
            W=${workingdir}
            if [[ $(echo ${W} | /bin/grep -o '/' | /bin/wc -l) -gt ${split} ]]; then
                workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
            fi
        
            PROMPT="%F{255}%K{53}${usersymbol}"
            if [[ -n "${SSH_CLIENT}" ]]; then
                PROMPT+="%n@%m"
            fi
            PROMPT+="%F{53}%K{91}"
            PROMPT+="%F{255}%K{91}${workingdir}"
            PROMPT+="%F{91}%K{140}"
            PROMPT+="${exitsymbol}"
            PROMPT+="%F{140}%k%f%k "

            vcs_info
            RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91}%B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53} %E'
        }
        ;;
    *)
        printf "\n\n [Oh Boy, something's wrong.]\n"
        PROMPT="> "
        ;;
esac








