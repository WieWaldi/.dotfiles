#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/01-options.zsh                                        |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# |                                                                         |
# +-------------------------------------------------------------------------+

# History setting.
export HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h
export SAVEHIST=$(( 100 * 1000 ))
export HISTSIZE=$(( 1.2 * SAVEHIST ))
export HISTTIMEFORMAT="[%F %T] "
setopt HIST_FCNTL_LOCK
setopt appendhistory autocd extendedglob notify
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

# Auto/Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zmodload zsh/complist
zmodload zsh/system
compinit
_comp_options+=(globdots)

# Other stuff
unsetopt beep
bindkey -e
setopt NUMERIC_GLOB_SORT
setopt HASH_EXECUTABLES_ONLY
setopt INTERACTIVE_COMMENTS

