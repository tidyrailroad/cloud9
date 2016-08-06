FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git && \
    mkdir /opt && \
    mkdir /opt/c9sdk && \
    git -C /opt/c9sdk init && \
    git -C /opt/c9sdk remote add origin git://github.com/c9/core.git && \
    git -C /opt/c9sdk pull origin master && \
    apk add bash && \
    apk add wget && \
    apk add ca-certificates && \
    apk add nodejs && \
    apk add make && \
    /opt/c9sdk/scripts/install-sdk.sh && \
    curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash && \
ENTRYPOINT ["node", "/opt/c9sdk/server.js"]
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/root"]