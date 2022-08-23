#!/usr/bin/env zsh
#
# +----------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/03-prompt.zsh                                            |
# +----------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# |                                                                            |
# +----------------------------------------------------------------------------+

# +----- Variables ------------------------------------------------------------+
prompt_symbol_user_norm="${prompt_symbol_user_norm:-}"
prompt_symbol_user_root="${prompt_symbol_user_root:-}"
prompt_symbol_exit_0="${prompt_symbol_exit_0:-}"
prompt_symbol_exit_1="${prompt_symbol_exit_1:-}"
prompt_symbol_workingdir="${prompt_workingdir_symbol:- }"
prompt_symbol_vimode="${prompt_symbol_vimode_ins}"
CURRENT_BG='NONE'

# +----- GIT & vcs_invo related -----------------------------------------------+
zle -N zle-keymap-select
zle -N zle-line-finish
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*+*:*' debug false
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%b %F{green}%m%u%c"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st git-remotebranch

# +----- Functions ------------------------------------------------------------+
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '^??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[misc]+='?'
    fi
}

+vi-git-st() {
    local ahead behind
    local -a gitstatus
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" )
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" )
    hook_com[misc]+=${(j:/:)gitstatus}
}

+vi-git-remotebranch() {
    local remote
    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
    #if [[ -n ${remote} && ${remote#*/} != ${hook_com[branch]} ]] ; then
        hook_com[branch]="${hook_com[branch]} [${remote}]"
    fi
}

get_usersymbol() {
    if [[ $(id -u) = 0 ]]; then
        prompt_symbol_user="${prompt_symbol_user_root}"
    else
        prompt_symbol_user="${prompt_symbol_user_norm}"
    fi
}

build_prompt_fancy() {
    # prompt_segment black default "${prompt_symbol_user} %n@%m" 
    prompt_segment ${prompt_segment3_bg} ${prompt_segment3_fg} "${prompt_symbol_user}%n@%m" 
    # prompt_segment green default "${prompt_symbol_workingdir}${workingdir}"
    prompt_segment ${prompt_segment2_bg} ${prompt_segment2_fg} "${prompt_symbol_workingdir}${workingdir}"
    # prompt_segment blue white "${prompt_symbol_exit}"
    prompt_segment ${prompt_segment1_bg} ${prompt_segment1_fg} "${prompt_symbol_exit}"
    prompt_segend
}

build_rprompt_fancy() {
    # prompt_rsegment blue white " %T"
    prompt_rsegment ${prompt_segment1_bg} ${prompt_segment1_fg} "%T"
    # prompt_rsegment green black "${vcs_info_msg_0_}"
    prompt_rsegment ${prompt_segment2_bg} ${prompt_segment2_fg} "${vcs_info_msg_0_}"
    # prompt_rsegment red white "${prompt_symbol_vimode}"
    prompt_rsegment ${prompt_segment3_bg} ${prompt_segment3_fg} "${prompt_symbol_vimode}"
    prompt_rsegend
}

# +----- Main -----------------------------------------------------------------+
get_usersymbol
case ${TERM} in
    sshd|putty)
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    linux|screen*)
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        PROMPT=$'┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼'
        ;;
    urxvt|st|st-256color|tmux*|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT='%{%f%b%k%}$(build_prompt_fancy)'
        RPROMPT='%{%f%b%k%}$(build_rprompt_fancy)'
        # prompt_usersymbol
        # PROMPT="%F{255}%K{53}${usersymbol}"
        # PROMPT+='%n@%m'
        # PROMPT+='%F{53}%K{91}'
        # PROMPT+='%F{255}%K{91}${workingdir}'
        # PROMPT+='%F{91}%K{140}'
        # PROMPT+='${exitsymbol}'
        # PROMPT+='%F{140}%k%f%k '
        # RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91} %B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53}${vi_mode_symbol}%F{255} %E'
        ;;
    *)
        printf "\n\n [Oh Boy, something's wrong.]\n"
        PROMPT="> "
        ;;
esac
