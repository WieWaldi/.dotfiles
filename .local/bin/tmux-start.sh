#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | ~/.local/bin/tmux-start.sh                                              |
# +-------------------------------------------------------------------------+
# | Copyright © 2022 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

set +e; sessions="$(tmux ls 2>&1)"; tmux_exit="$?"; set -e

if [[ $tmux_exit -ne 0 ]]; then
    echo "No session found. Hold on, I will create one for you."
    tmux new-session -d -s Login
    tmux rename-window -t Login:1 'Master'
    tmux new-window -t Login:2 -n 'Slave'
    tmux new-window -t Login:3 -n 'Scratch'
    tmux new-window -t Login:4 -n 'etc'
    tmux send-keys -t Login:Master '.local/share/fancy-motd/motd.sh' C-m
    tmux send-keys -t Login:Master '.local/bin/colortest-pac-man-3.sh' C-m

    tmux attach-session -t Login:Master
else
    tmux attach-session -t Login:Master
fi


exit 0 
