#!/bin/sh

(
    [ ! -d /init ] ||
    ls -1 /etc/init.d | while read SCRIPT
    do
	[ -f /init/${SCRIPT} ] && ( /bin/sh /init/${SCRIPT} || exit 64 ) &&
	true
    done &&
    true
) &&
node /opt/cloud9/c9sdk/server.js ${@} &&
true
