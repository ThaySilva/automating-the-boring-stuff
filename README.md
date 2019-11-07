# Automating the boring stuff

<!-- TOC -->
- [Automating the boring stuff](#Automating-the-boring-stuff)
  - [Bash scripts](#Bash-scripts)
    - [Remove trailing spaces](#Remove-trailing-spaces)
    - [Tmux with OpenStack logs](#Tmux-with-OpenStack-logs)
    - [Daily apt update and home dir file count](#daily-apt-update-and-home-dir-file-count)
<!-- TOC -->

## Bash scripts
### Remove trailing spaces
This script removes all trailing white spaces at the end of lines, and blank lines at the end of the file. When executing this script you can pass in a file or a directory, the script will loop through the directory and look for files with .py or .sh extensions.

Usage:
```
bash remove_trailing_spaces.sh <FILE/DIR-NAME>
```
### Tmux with OpenStack logs
This script creates a tmux session with an OpenStack service logs per window.

Note: This considers that you have a running OpenStack deployment

Usage:
```
bash tmux_with_openstack_logs.sh
```
### Daily apt update and home dir file count
This script will do apt update and count the total size of the files in your home directory. To use this script daily copy the file to your home directory:
```
cp automating-the-boring-stuff/bash/daily_update_ubuntu.sh ~/.daily_update_ubuntu.sh
```
And add the following command to your bashrc file:
```
bash ~/.daily_update_ubuntu.sh
```