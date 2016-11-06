#!/bin/sh

COMMIT_ID=$(git rev-parse HEAD) &&
    docker build --tag emorymerryman/cloud9:${COMMIT_ID} . &&
    docker \
    run \
    --restart always \
    --interactive \
    --tty \
    --detach \
    --privileged \
    --net host \
    --env DISPLAY \
    --volume /tmp/.X11 \
    --volume dot_ssh:/usr/local/src \
    alpine:3.4 sh &&
    docker \
    run \
    --env PROJECT_NAME=dot_ssh \
    --env PROJECT_COMMAND="docker exec --interactive --tty $(docker ps -q --latest) sh -c \"cd /usr/local/src && exec /bin/sh\"" \
    --privileged \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume dot_ssh:/workspace \
    emorymerryman/cloud9:${COMMIT_ID} &&
    true