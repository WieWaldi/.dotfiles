#!/usr/bin/env zsh
#
# +----------------------------------------------------------------------------+
# | ~/.zshenv                                                                  |
# +----------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# |                                                                            |
# | This file, .zshenv, is the first file sourced by zsh for EACH shell,       |
# | whether it's interactive or not. This includes non-interactive             |
# | sub-shells! So, put as little in this file as possible,                    |
# | to avoid performance impact.                                               |
# |                                                                            |
# | Note: The shebang #!/bin/zsh is strictly necessary for executable          |
# | scripts only, but without it, you might not always get correct syntax      |
# | highlighting when viewing the code.                                        |
# |                                                                            |
# | Tell zsh where to look for our dotfiles. By default, Zsh will look         |
# | for dotfiles in $HOME (and find this file), but once $ZDOTDIR is defined   |
# | it will start looking in that dir instead. ${X:=Y} specifies a default     |
# | value Y to use for parameter X, if X has not been set or is null.          |
# | This will actually create X, if necessary, and assign the value to it.     |
# |                                                                            |
# | To set a default value that is returned *without* setting X, use ${X:-Y}   |
# | As in other shells, ~ expands to $HOME _at the beginning of                |
# | a value only._                                                             |
# |                                                                            |
# +----------------------------------------------------------------------------+

# +----- Environment (XDG) ----------------------------------------------------+
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_PICTURES_DIR="${HOME}/Pictures"

# +----- Environment (llm-term) -----------------------------------------------+
# export OPENAI_API_KEY="xxx"
# export OPENAI_MODEL="gpt-3.5-turbo"
# export OPENAI_MODEL="gpt-4"          # Defaults to "gpt-3.5-turbo"
# export OPENAI_SYSTEM_MESSAGE="You are a helpful assistant who talks like a pirate."

# +----- Environment (etc) ----------------------------------------------------+
export _JAVA_AWT_WM_NONREPARENTING=1

# +----- Environment (Zsh) ----------------------------------------------------+
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export SAVEHIST=$(( 100 * 1000 ))
export HISTSIZE=$(( 1.2 * SAVEHIST ))
export HISTTIMEFORMAT="[%F %T] "

# +----- Environment for Prompt -----------------------------------------------+
export prompt_symbol_vimode_ins=">i<"
export prompt_symbol_vimode_nrm=">n<"
# export prompt_symbol_vimode_ins=""
# export prompt_symbol_vimode_nrm=""

export prompt_symbol_exit_0=">0<"
export prompt_symbol_exit_1=">1<"
# export prompt_symbol_exit_0=""
# export prompt_symbol_exit_1=""

export prompt_symbol_disk_0="(HD)"
# export prompt_symbol_disk_0=" "
export prompt_symbol_disk_1="(HD+)"
# export prompt_symbol_disk_1=" "
export prompt_symbol_disk_3="(-HD-)"
# export prompt_symbol_disk_3=" "

# Prompt Color Theme: Blue Oyster
# export prompt_segment1_bg="140"
# export prompt_segment1_fg="91"
# export prompt_segment2_bg="91"
# export prompt_segment2_fg="255"
# export prompt_segment3_bg="53"
# export prompt_segment3_fg="255"

# Prompt Color Theme: Solarized light
export prompt_segment1_bg="14"
export prompt_segment1_fg="black"
export prompt_segment2_bg="10"
export prompt_segment2_fg="white"
export prompt_segment3_bg="8"
export prompt_segment3_fg="white"

# +----- Qt 5 and Qt 6 --------------------------------------------------------+
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"
export GDK_SCALE=1
export GDK_DPI_SCALE=1

# +----- fzf ------------------------------------------------------------------+
export FZF_CTRL_T_COMMAND="fd --hidden --exclude '.git' --exclude 'node_modules'"
export FZF_ALT_C_COMMAND="fd --hidden --exclude '.git' --exclude 'node_modules' --type d"

# +----- End ------------------------------------------------------------------+
