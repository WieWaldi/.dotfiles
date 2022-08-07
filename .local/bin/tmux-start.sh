#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | ~/.local/bin/tmux-start.sh                                                 |
# +----------------------------------------------------------------------------+
# | Copyright © 2022 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+

if [[ "$#" = "0" ]]; then
    echo "Session name not specified."
    exit 1
fi

session=$1
sessionexist=$(tmux list-session | grep $session)

if [[ "$sessionexist" = "" ]]; then
    tmux new-session -d -s $session
    tmux rename-window -t $session:1 'Master'
    tmux new-window -t $session:2 -n 'Slave'
    tmux new-window -t $session:3 -n 'Scratch'
    tmux new-window -t $session:4 -n 'etc'

    if [[ "$session" = "Login" ]]; then
        tmux send-keys -t $session:Master 'clear' C-m
        tmux send-keys -t $session:Master '.local/share/fancy-motd/motd.sh' C-m
        tmux send-keys -t $session:Master '.local/bin/colortest-pac-man-3.sh' C-m
    fi
    if [[ "$session" = "ScratchPad1" ]]; then
        tmux send-keys -t $session:Master 'figlet -f small RZ-Amper' C-m
    fi
    if [[ "$session" = "ScratchPad2" ]]; then
        tmux send-keys -t $session:Master 'bpytop' C-m
    fi
fi

tmux attach-session -t $session:Master
exit 0 
