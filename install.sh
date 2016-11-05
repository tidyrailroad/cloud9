#!/bin/sh

mkdir /root/bin && \
    node /opt/cloud9/c9sdk/server.js --listen 0.0.0.0 --auth user:password -p 8080 -w /usr/local/sr && \
    true