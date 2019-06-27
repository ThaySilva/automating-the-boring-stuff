#!/bin/bash

# Variable for session name
session_name=os_logs

# Create list with all OpenStack services names
mapfile -t os_services < <(systemctl list-units --full --all | grep "devstack@")

# Start a tmux session and window 0 with the logs of the first service on the list
tmux new-session -d -s "$session_name" -n "$(echo ${os_services[0]##* Devstack} | sed -e 's/[[:space:]]*$//' | grep -oP '(?<=devstack@).*?(?=.service)')"
tmux send-keys -t "$session_name:0" C-z "sudo journalctl -fu $(echo ${os_services[0]##* Devstack} | sed -e 's/[[:space:]]*$//')" Enter

# Loop through the rest of the list and create new windows
for (( i=1; i<${#os_services[@]}; i++ ))
do
    tmux new-window -t "$session_name:$i" -n "$(echo ${os_services[i]##* Devstack} | sed -e 's/[[:space:]]*$//' | grep -oP '(?<=devstack@).*?(?=.service)')"
    tmux send-keys -t "$session_name:$i" C-z "sudo journalctl -fu $(echo ${os_services[i]##* Devstack} | sed -e 's/[[:space:]]*$//')" Enter
done
