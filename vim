#!/bin/bash

CONTAINER_DIR=${PWD:${#HOME}}
CONTAINER_CMD=vim

#Check if running within docker for testing or running on the host
if grep docker /proc/1/cgroup -qa; then
    sudo docker run --rm -it  -e "CONTAINER_CMD=$CONTAINER_CMD" -e "CONTAINER_DIR=$CONTAINER_DIR" -h "git" -v home:/home/jamie jamie/devtools "$@"
else
    docker run --rm -it -e "CONTAINER_DIR=$CONTAINER_DIR" -h "git" -v ${HOME}:/home/jamie jamie/devtools
fi


