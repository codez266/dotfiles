#!/bin/zsh
arg=$1
tcommand="source ~/$arg/bin/activate"
echo $arg
tmux new -s $arg \; send-keys "$tcommand" C-m \; new-window \; send-keys "$tcommand" C-m \; new-window \; send-keys "$tcommand" C-m
