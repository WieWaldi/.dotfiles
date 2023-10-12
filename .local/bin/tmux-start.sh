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
    case "${session}" in

    Login)
        tmux new-session -d -s $session
        tmux rename-window -t $session:1 ' Master'
        tmux new-window -t $session:2 -n ' Slave'
        tmux new-window -t $session:3 -n '󰢹 Remote'
        tmux new-window -t $session:4 -n ' etc'
        tmux new-window -t $session:5 -n '󱄕 System'
        tmux new-window -t $session:6 -n ' Monitoring'
        tmux new-window -t $session:7 -n ' Notes'
        tmux new-window -t $session:8 -n ' Code 1'
        tmux new-window -t $session:9 -n ' Code 2'
        tmux send-keys -t $session:1 'clear' C-m
        tmux send-keys -t $session:1 '.local/share/fancy-motd/motd.sh' C-m
        tmux send-keys -t $session:1 '.local/bin/colortest-pac-man-3.sh' C-m
        tmux send-keys -t $session:8 'cd ~/Repos/WieWaldi' C-m
        tmux send-keys -t $session:8 'clear' C-m
        tmux send-keys -t $session:9 'cd ~/Repos/WieWaldi' C-m
        tmux send-keys -t $session:9 'clear' C-m
        ;;
    
    Login-Simple)
        tmux new-session -d -s $session
        tmux rename-window -t $session:1 ' Master'
        tmux new-window -t $session:2 -n ' Slave'
        tmux new-window -t $session:3 -n ' etc'
        tmux send-keys -t $session:1 'clear' C-m
        tmux send-keys -t $session:1 '.local/bin/colortest-pac-man-3.sh' C-m
        ;;
    
    ScratchPad1)
        tmux new-session -d -s $session
        tmux rename-window -t $session:1 ' Master'
        tmux new-window -t $session:2 -n ' Slave'
        tmux send-keys -t $session:1 'clear' C-m
        tmux send-keys -t $session:1 'figlet -f small RZ-Amper' C-m
        ;;
    
    ScratchPad2)
        tmux new-session -d -s $session
        tmux rename-window -t $session:1 ' Monitoring'
        tmux new-window -t $session:2 -n ' System'
        tmux send-keys -t $session:1 'clear' C-m
        tmux send-keys -t $session:1 'bpytop' C-m
        ;;
    
    *)
        tmux new-session -d -s $session
        tmux rename-window -t $session:1 ' Master'
        tmux new-window -t $session:2 -n ' Slave'
        ;;
    esac
fi

tmux attach-session -t $session:1
exit 0 
