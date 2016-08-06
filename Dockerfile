FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git && \
    mkdir /opt && \
    mkdir /opt/c9sdk && \
    git -C /opt/c9sdk init && \
    git -C /opt/c9sdk remote add origin git://github.com/c9/core.git && \
    git -C /opt/c9sdk fetch origin master && \
    git -C /opt/c9sdk checkout master && \
    apk add bash && \
    apk add wget && \
    apk add make && \
    apk add gcc && \
    apk add python && \
#    /opt/c9sdk/scripts/install-sdk.sh
ENTRYPOINT ["node", "/opt/c9sdk/server.js"]
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/root"]