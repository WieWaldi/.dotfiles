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
prompt_symbol_pwd_writable_0="${prompt_symbol_pwd_writable_0:-󱘵 }"
prompt_symbol_pwd_writable_1="${prompt_symbol_pwd_writable_1:-󱘩 }"
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

build_prompt_short() {
    echo -n "%n@%m >"
}

build_prompt_2line() {
    echo -n "┌[%n@%m]──[%(5~|%-1~/…/%3~|%4~)]──[%T]\n└────╼"
}

# The Blue Oyster Rainbow 2
# build_prompt_fancy() {
#     prompt_segment ${prompt_segment0_bg} ${prompt_segment0_fg} "${prompt_symbol_user} %n@%m" 
#     prompt_segment ${prompt_segment1_bg} ${prompt_segment1_fg} ""
#     prompt_segment ${prompt_segment2_bg} ${prompt_segment2_fg} ""
#     prompt_segment ${prompt_segment3_bg} ${prompt_segment3_fg} ""
#     prompt_segment ${prompt_segment4_bg} ${prompt_segment4_fg} ""
#     prompt_segment ${prompt_segment5_bg} ${prompt_segment5_fg} "${prompt_symbol_pwd_writable} ${workingdir}"
#     prompt_segment ${prompt_segment6_bg} ${prompt_segment6_fg} ""
#     prompt_segment ${prompt_segment7_bg} ${prompt_segment7_fg} ""
#     prompt_segment ${prompt_segment8_bg} ${prompt_segment8_fg} ""
#     prompt_segment ${prompt_segment9_bg} ${prompt_segment9_fg} ""
#     prompt_segment ${prompt_segment10_bg} ${prompt_segment10_fg} ""
#     prompt_segment ${prompt_segment11_bg} ${prompt_segment11_fg} "${prompt_symbol_exit}"
#     prompt_segend
# }
# build_rprompt_fancy() {
#     prompt_rsegment ${prompt_segment1_bg} ${prompt_segment1_fg} "${prompt_symbol_clock_1} %T"
#     prompt_rsegment ${prompt_segment2_bg} ${prompt_segment2_fg} "${vcs_info_msg_0_}"
#     prompt_rsegment ${prompt_segment3_bg} ${prompt_segment3_fg} "${prompt_symbol_vimode}"
#     prompt_rsegend
# }

#The Blue Oyster Gradient 2
build_prompt_fancy() {
    prompt_segment ${prompt_segment0_bg} ${prompt_segment0_fg} "${prompt_symbol_user} %n@%m" 
    prompt_segment ${prompt_segment1_bg} ${prompt_segment1_fg} ""
    prompt_segment ${prompt_segment2_bg} ${prompt_segment2_fg} ""
    prompt_segment ${prompt_segment3_bg} ${prompt_segment3_fg} ""
    prompt_segment ${prompt_segment4_bg} ${prompt_segment4_fg} "${prompt_symbol_pwd_writable} ${workingdir}"
    prompt_segment ${prompt_segment5_bg} ${prompt_segment5_fg} ""
    prompt_segment ${prompt_segment6_bg} ${prompt_segment6_fg} ""
    prompt_segment ${prompt_segment7_bg} ${prompt_segment7_fg} ""
    prompt_segment ${prompt_segment8_bg} ${prompt_segment8_fg} "${prompt_symbol_exit}"
    prompt_segend
}
build_rprompt_fancy() {
    prompt_rsegment ${prompt_segment8_bg} ${prompt_segment8_fg} "${prompt_symbol_clock_1} %T"
    prompt_rsegment ${prompt_segment4_bg} ${prompt_segment4_fg} "${vcs_info_msg_0_}"
    prompt_rsegment ${prompt_segment0_bg} ${prompt_segment0_fg} "${prompt_symbol_vimode}"
    prompt_rsegend
}

# +----- Main -----------------------------------------------------------------+
get_usersymbol
case ${TERM} in
    sshd|putty)
        PROMPT='$(build_prompt_2line)'
        ;;
    linux|screen*)
        printf "\n\n [Oh Boy, get on a graphical terminal!]\n"
        PROMPT='$(build_prompt_short)'
        ;;
    urxvt|st|st-256color|tmux*|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT='%{%f%b%k%}$(build_prompt_fancy)'
        RPROMPT='%{%f%b%k%}$(build_rprompt_fancy)'
        ;;
    *)
        printf "\n\n [Oh Boy, something's wrong.]\n"
        PROMPT="> "
        ;;
esac
