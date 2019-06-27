# Automating the boring stuff

<!-- TOC -->
- [Automating the boring stuff](#Automating-the-boring-stuff)
  - [Bash scripts](#Bash-scripts)
    - [Remove trailing spaces](#Remove-trailing-spaces)
    - [Tmux with OpenStack logs](#Tmux-with-OpenStack-logs)
<!-- TOC -->

## Bash scripts
### Remove trailing spaces
This script removes all trailing white spaces at the end of lines, and blank lines at the end of the file. 

Usage:
```
bash remove_trailing_spaces.sh <FILE-NAME>
```
### Tmux with OpenStack logs
This script creates a tmux session with an OpenStack service logs per window.

Note: This considers that you have a running OpenStack deployment

Usage:
```
bash tmux_with_openstack_logs.sh
```
