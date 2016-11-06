#!/bin/sh

mkdir /usr/local/src &&
    ln --symbolic --force /workspace /usr/local/src/${PROJECT_NAME} &&
    echo ${PROJECT_COMMAND} >> ${HOME}/.bash_profile &&
    node /opt/cloud9/c9sdk/server.js --listen 0.0.0.0 --auth user:password -p 8080 -w /usr/local/src/${PROJECT_NAME} &&
    true