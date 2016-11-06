#!/bin/sh

echo docker exec --interactive --tty ${CONTAINER_ID} sh >> ${HOME}/.bash_profile &&
    node /opt/cloud9/c9sdk/server.js --listen 0.0.0.0 --auth user:password -p 8080 -w /workspace/* &&
    true