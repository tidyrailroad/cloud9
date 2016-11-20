#!/bin/sh

(
    [ ! -d /init ] ||
    ls -1 /init | while read SCRIPT
    do
	[ -f /init/${SCRIPT} ] && ( /usr/bin/sh /init/${SCRIPT} || exit 64 ) &&
	true
    done &&
    true
) &&
node /opt/cloud9/c9sdk/server.js ${@} &&
true
