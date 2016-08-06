FROM fedora:23
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
    dnf update --assumeyes && \
    dnf clean all
VOLUME /opt/c9sdk
EXPOSE 8080
ENTRYPOINT ["node", "/opt/c9sdk/server.js"]
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/root"]