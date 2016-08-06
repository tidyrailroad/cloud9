FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git && \
    mkdir /opt && \
    mkdir /opt/c9sdk && \
    git -C /opt/c9sdk init && \
    git -C /opt/c9sdk remote add origin git@github.com:desertedscorpion/install.git && \
    apk add openssh && \
    git -C /opt/c9sdk pull origin scratch/125CE43B-B0CD-4A78-95D1-5064F2609E96 && \
    apk add bash && \
    apk add wget && \
    apk add make && \
    apk add gcc && \
    apk add python && \
#    apk add ca-certificates && \
#    apk add nodejs && \
#    apk add gcc && \
    /opt/c9sdk/scripts/install-sdk.sh && \
#    curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash && \
ENTRYPOINT ["node", "/opt/c9sdk/server.js"]
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/root"]