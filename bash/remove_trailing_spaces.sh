#!/bin/bash

## Set up information for user when -h is passed in with the script
while getopts ":hf" option
do
    case "${option}" in
     h ) echo -e "\n\nUsage: bash remove_trailing_spaces.sh <FILE/DIR NAME>\n\n" && exit 1
     ;;
     help ) echo -e "\n\nUsage: bash remove_trailing_spaces.sh <FILE/DIR NAME>\n\n" && exit 1
     ;;
    esac
done

FILE=$1
is_dir="false"

check_file_extension() {
    if [[ $1 == *.py ]] || [[ $1 == *.sh ]]
    then
        echo "Working on file $1"
        ## Remove trailing white spaces
        sed -i 's/[[:space:]]*$//' $1

        ## Remove blank lines at end of file
        sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $1
    fi
}

check_if_path_is_dir() {
    if [[ -d $1 ]]; then
        is_dir="true"
    elif [[ -f $1 ]]; then
        is_dir="false"
        check_file_extension $1
    fi
}

read_dir() {
    for file in $1/*
    do
        check_if_path_is_dir $file
        if [[ $is_dir == "true" ]]; then
            read_dir $file
        fi
    done
}

echo "Removing all trailing white spaces and blank lines from .py and .sh
files."
if [ "$FILE" != "" ] ; then
    check_if_path_is_dir $FILE
    if [[ $is_dir == "true" ]]; then
        read_dir $FILE
    else
        check_file_extension $FILE
    fi
    echo "All files are cleaned!"
else
    ## Error message
    echo -e "A file must be specified. \nExiting script."
    exit 1
fi
