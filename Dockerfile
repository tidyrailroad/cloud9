FROM fedora:23
COPY docker.repo /etc/yum.repos.d/
RUN \
    dnf update --assumeyes && \
    dnf install --assumeyes git make python tar which bzip2 ncurses gmp-devel mpfr-devel libmpc-devel glibc-devel flex bison glibc-static zlib-devel gcc gcc-c++ nodejs && \
    mkdir /opt/c9sdk && \
    chmod 0555 /opt/c9sdk && \
    git -C /opt/c9sdk init && \
    git -C /opt/c9sdk remote add origin git://github.com/c9/core.git && \
    git -C /opt/c9sdk pull origin master && \
    /opt/c9sdk/scripts/install-sdk.sh && \
    curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash && \
    dnf install --assumeyes docker-engine && \
    dnf update --assumeyes && \
    dnf clean all && \
    true
ENTRYPOINT \
    mkdir /root/bin && \
    git -C /root/bin init && \
    git -C /root/bin remote add upstream ${BIN} && \
    git -C /root/bin remote set-url --push upstream no_push && \
    git -C /root/bin fetch upstream master && \
    git -C /root/bin checkout upstream/master && \
    mkdir /root/workspace && \
    PROJECT_NAME_1=${PROJECT_UPSTREAM%.*} && \
    PROJECT_NAME=${PROJECT_NAME_1##*/} && \
    mkdir /root/workspace/${PROJECT_NAME} && \
    git -C /root/workspace/${PROJECT_NAME} init && \
    git -C /root/workspace/${PROJECT_NAME} remote add upstream ${PROJECT_UPSTREAM} && \
    git -C /root/workspace/${PROJECT_NAME} remote set-url --push upstream no_push && \
    git -C /root/workspace/${PROJECT_NAME} remote add origin ${PROJECT_ORIGIN} && \
    git -C /root/workspace config user.email "${GIT_EMAIL}" && \
    git -C /root/workspace config user.name "${GIT_NAME}" && \
    node /opt/c9sdk/server.js --listen 0.0.0.0 --auth user:password -p 8080 -w /root/workspace/${PROJECT_NAME} && \
    true
EXPOSE 8080