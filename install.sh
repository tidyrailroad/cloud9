#!/bin/sh

dnf update --assumeyes &&
    dnf install --assumeyes git make python tar which bzip2 ncurses gmp-devel mpfr-devel libmpc-devel glibc-devel flex bison glibc-static zlib-devel gcc gcc-c++ nodejs &&
    mkdir /opt/cloud9/c9sdk &&
    git -C /opt/cloud9/c9sdk init &&
    git -C /opt/cloud9/c9sdk remote add origin git://github.com/c9/core.git &&
    git -C /opt//cloud9/c9sdk pull origin master &&
    /opt/cloud9/c9sdk/scripts/install-sdk.sh &&
    curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash &&
    cp /opt/cloud9/docker.repo /etc/yum.repos.d/ &&
    dnf install --assumeyes docker-engine &&
    dnf install --assumeyes util-linux-user &&
    echo ${HOME}/bin/shell.sh >> /etc/shells &&s
    dnf update --assumeyes &&
    dnf clean all &&
    true
