#!/bin/sh

[ -d /etc/init.d ] &&
ls -1 /etc/init.d | while read SCRIPT
do
    [ -f /etc/init.d/${SCRIPT} /bin/sh /etc/init.d/${SCRIPT} || exit 64
done &&
node /opt/cloud9/c9sdk/server.js ${@} &&
true
