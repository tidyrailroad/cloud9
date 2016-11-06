#!/bin/sh

COMMIT_ID=$(git rev-parse HEAD) &&
    # build the image
    docker \
    build \
    --tag emorymerryman/cloud9:${COMMIT_ID} \
    . &&
    # run an instance of alpine
    # you can run whatever you want
    # the options are not important
    # but b/c of the options below
    # this container will effectively have
    # root privileges on host
    # and can run x11 gui apps
    docker \
    run \
    --interactive \
    --tty \
    --detach \
    --privileged \
    --net host \
    --env DISPLAY \
    --volume /tmp/.X11 \
    alpine:3.4 sh &&
    # !!!!!
    # CLOUD9
    # !!!!!
    docker \
    run \
    --interactive \
    --tty \
    --detach \
    # when you go to cloud9 in the browser, you should see alpine in the title bar, etc.
    --env PROJECT_NAME=alpine \
    # The terminal should go to the previously created alpine instance (instance of the fedora based cloud9 instance)
    # It should be as if you are on alpine.  (fedora should be invisible to the user)
    --env PROJECT_COMMAND="docker exec --interactive --tty $(docker ps -q --latest) sh -c \"cd /usr/local/src && sh\"" \
    # this is necessary b/c to use docker
    --privileged \
    # necessary to use docker
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --publish-all \
    emorymerryman/cloud9:${COMMIT_ID} &&
    docker ps --latest &&
    echo ${COMMIT_ID} &&
    true