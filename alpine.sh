#!/bin/sh

docker \
    run \
    --restart always \
    --interactive \
    --tty \
    --detach \
    --privileged \
    --net host \
    --export DISPLAY \
    --volume /tmp/.X11 \
    alpine:3.4 sh &&
    docker \
    run \
    --env CONTAINER_ID=$(docker ps -q --latest) \
    --privileged \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    emorymerryman/cloud9:$(git rev-parse HEAD) &&
    true