#!/bin/bash

# References:
# what the set command does: https://unix.stackexchange.com/questions/308260/what-does-set-do-in-this-dockerfile-entrypoint
# looping over multiple items at a time: https://stackoverflow.com/questions/25814250/loop-with-more-than-one-item-at-a-time
# async commands: https://superuser.com/questions/318390/bash-run-commands-asynchronously-at-a-delay

source ./ado/do_patch_node_list

tag='do_patch'

# if [[ ! -n $CHEF_SERVER ]]; then
#     echo "[ERROR] Missing a required parameter: chef server"
#     exit 1
# fi

if [ ${#node_list[@]} == 0 ]; then
    echo '[ERROR] Empty list detected'
    exit 1
fi

original_pp=( "$@" )

set -- ${node_list[@]}

# Loops through 5 nodes a time to speed things up.
# We can't do > 1 at the exact same time as this will cause multiple API calls to chef server simultaneously and it will select only one. This is why there is a 1 sec sleep added.
while (( $# > 0 )); do

    sudo knife tag create $1 $tag &
    cmd_pid=$!

    if [ ! -z $2 ]; then
        sleep 1 && sudo knife tag create $2 $tag &
        cmd_pid=$!
    fi

    if [ ! -z $3 ]; then
        sleep 2 && sudo knife tag create $3 $tag &
        cmd_pid=$!
    fi

    if [ ! -z $4 ]; then
        sleep 3 && sudo knife tag create $4 $tag &
        cmd_pid=$!
    fi

    if [ ! -z $5 ]; then
        sleep 4 && sudo knife tag create $5 $tag &
        cmd_pid=$!
    fi

    # Wait for the last async command to finish before tagging the next 5 nodes.
    wait $cmd_pid

    # Shift to the next 5 nodes, or shift to the remaining nodes if less than 5 remaining
    shift 5 || shift $#
done

# Set back to our original positional arguments (if any)
set -- "${original_pp[@]}"
