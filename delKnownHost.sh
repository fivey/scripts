#!/bin/bash

grep $1 ~/.ssh/known_hosts > /dev/null
if [ $? == 0 ]
then
    sed "/$1/d" ~/.ssh/known_hosts > /tmp/known_hosts
    mv /tmp/known_hosts ~/.ssh/known_hosts
    echo "$1 removed from known hosts"
    exit 0
else
    echo "ERROR: $1 not found in known hosts"
    echo "ERROR: $1 NOT removed from known hosts"
    exit 1
fi
