FROM alpine:3.4
MAINTAINER Emory Merryman emory.merryman@gmail.com
COPY docker.repo run.sh entrypoint.sh /opt/cloud9/
RUN ["/bin/sh", "/opt/cloud9/run.sh"]
ENTRYPOINT ["/bin/sh", "/opt/cloud9/entrypoint.sh"]
CMD []
