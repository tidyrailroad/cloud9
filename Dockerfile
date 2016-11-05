FROM fedora:24
COPY ["docker.repo", "install.sh", "entrypoint.sh" "/opt/cloud9/"]
RUN ["/usr/bin/sh", "/opt/cloud9/install.sh"]
ENTRYPOINT ["/usr/bin/sh", "/opt/cloud9/entrypoint.sh"]
EXPOSE 8080