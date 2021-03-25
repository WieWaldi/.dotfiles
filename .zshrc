# +-------------------------------------------------------------------------+
# | ~/.zshrc                                                                |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

if [[ -f ${HOME}/.alias ]]; then
    source ${HOME}/.alias
else
    echo "Could not find ${HOME}/.alias"
fi

# if [[ -f ${HOME}/.zsh_functions ]]; then
#     source ${HOME}/.zsh_functions
# else
#     echo "Could not find ${HOME}/.zsh_functions"
# fi


zmodload zsh/system
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/wiewaldi/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "


compinit
ZLE_RPROMPT_INDENT=0
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
setopt prompt_subst
unsetopt beep
bindkey -e


case ${TERM} in
    sshd|putty)
        prompt_command_tiny
        ;;
    linux|screen*)
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        prompt_command_tiny
        ;;
    urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        printf "Fuck yeah!\n"
        precmd() {
            exitcode="$?"
            split=3
            workingdir=" $(/bin/pwd | /bin/sed 's@'"$HOME"'@~@')"
            
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
            RPROMPT='${vcs_info_msg_0_}%# '
        }
        ;;
esac








