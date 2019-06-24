#!/bin/bash

## Set up information for user when -h is passed in with the script
while getopts ":hf" option
do
    case "${option}" in
     h ) echo -e "\n\nUsage: bash remove_trailing_spaces.sh <FILE NAME>\n\n" && exit 1
     ;;
     help ) echo -e "\n\nUsage: bash remove_trailing_spaces.sh <FILE NAME>\n\n" && exit 1
     ;;
    esac
done

FILE=$1

if [ "$FILE" != "" ] ; then
    ## Remove trailing white spaces
    sed -i 's/[[:space:]]*$//' $FILE

    ## Remove blank lines at end of file
    sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $FILE
else
    ## Error message
    echo -e "A file must be specified. \nExiting script."
    exit 1
fi
