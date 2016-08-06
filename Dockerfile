FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git && \
    mkdir /opt && \
    mkdir /opt/c9sdk && \
    git -C /opt/c9sdk init && \
    git -C /opt/c9sdk remote add origin git@github.com:desertedscorpion/core.git && \
    apk add openssh && \
    git -C /opt/c9sdk fetch origin scratch/1B64DF14-E5F3-4D91-923E-637E0577CAD7 && \
    git -C /opt/c9sdk checkout scratch/1B64DF14-E5F3-4D91-923E-637E0577CAD7 && \
    apk add bash && \
    apk add wget && \
    apk add make && \
    apk add gcc && \
    apk add python &&\
    /opt/c9sdk/scripts/install-sdk.sh
ENTRYPOINT ["node", "/opt/c9sdk/server.js"]
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/root"]