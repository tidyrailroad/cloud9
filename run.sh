#!/bin/sh

apk update &&
apk upgrade &&
apk add git &&
apk add make &&
apk add python &&
apk add tar &&
apk add which &&
apk add bzip2 &&
apk add ncurses &&
apk add gmp-dev &&
apk add mpfr-dev &&
apk add mpc &&
# apk add glibc-devel &&
apk add flex &&
apk add bison &&
# apk add glibc-static &&
apk add zlib-dev &&
apk add gcc &&
apk add g++ &&
apk add nodejs &&
apk add bash &&
mkdir /opt/cloud9/c9sdk &&
git -C /opt/cloud9/c9sdk init &&
git -C /opt/cloud9/c9sdk remote add origin git://github.com/c9/core.git &&
git -C /opt/cloud9/c9sdk pull origin master &&
/opt/cloud9/c9sdk/scripts/install-sdk.sh &&
curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash &&
cp /opt/cloud9/docker.repo /etc/yum.repos.d/ &&
apk add docker &&
apk add util-linux-user &&
true
