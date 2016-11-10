FROM fedora:24
COPY docker.repo run.sh entrypoint.sh /opt/cloud9/
RUN ["/usr/bin/sh", "/opt/cloud9/run.sh"]
ENTRYPOINT ["/usr/bin/sh", "/opt/cloud9/entrypoint.sh"]
CMD []
EXPOSE 8080
