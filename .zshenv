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
export prompt_symbol_vimode_ins=""
export prompt_symbol_vimode_nrm=""
export prompt_symbol_exit_0=""
export prompt_symbol_exit_1=""
export prompt_symbol_clock_1="󰅐 "
export prompt_symbol_pwd_writable_0="󱘵 "
export prompt_symbol_pwd_writable_1="󱘩 "

# Prompt Color Theme: Blue Oyster Rainbow
# export prompt_segment0_bg="19"
# export prompt_segment0_fg="252"
# export prompt_segment1_bg="26"
# export prompt_segment1_fg="250"
# export prompt_segment2_bg="33"
# export prompt_segment2_fg="250"
# export prompt_segment3_bg="111"
# export prompt_segment3_fg="255"
# export prompt_segment4_bg="116"
# export prompt_segment4_fg="19"
# export prompt_segment5_bg="121"
# export prompt_segment5_fg="234"
# export prompt_segment6_bg="156"
# export prompt_segment6_fg="255"
# export prompt_segment7_bg="149"
# export prompt_segment7_fg="255"
# export prompt_segment8_bg="142"
# export prompt_segment8_fg="255"
# export prompt_segment9_bg="208"
# export prompt_segment9_fg="255"
# export prompt_segment10_bg="203"
# export prompt_segment10_fg="255"
# export prompt_segment11_bg="198"
# export prompt_segment11_fg="255"

# Prompt Color Theme: Blue Oyster Gradient 2
# export prompt_segment0_bg="#5f005f"
# export prompt_segment0_fg="#FAD0FA"
# export prompt_segment1_bg="#690E69"
# export prompt_segment1_fg="250"
# export prompt_segment2_bg="#7E297E"
# export prompt_segment2_fg="250"
# export prompt_segment3_bg="#934692"
# export prompt_segment3_fg="255"
# export prompt_segment4_bg="#A761A7"
# export prompt_segment4_fg="255"
# export prompt_segment5_bg="#BC7DBC"
# export prompt_segment5_fg="234"
# export prompt_segment6_bg="#D199D1"
# export prompt_segment6_fg="255"
# export prompt_segment7_bg="#E6B5E6"
# export prompt_segment7_fg="255"
# export prompt_segment8_bg="#FAD0FA"
# export prompt_segment8_fg="#7E297E"

# Prompt Color Theme: Blue Oyster Gradient 2
export prompt_segment0_bg="#5f005f"
export prompt_segment0_fg="#FAD0FA"
export prompt_segment1_bg="#670D6B"
export prompt_segment1_fg="250"
export prompt_segment2_bg="#711E7A"
export prompt_segment2_fg="250"
export prompt_segment3_bg="#7B3089"
export prompt_segment3_fg="255"
export prompt_segment4_bg="#854199"
export prompt_segment4_fg="255"
export prompt_segment5_bg="#9053A9"
export prompt_segment5_fg="234"
export prompt_segment6_bg="#9A65B8"
export prompt_segment6_fg="255"
export prompt_segment7_bg="#A271C3"
export prompt_segment7_fg="255"
export prompt_segment8_bg="#AF87D7"
export prompt_segment8_fg="#7E297E"

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
