# The Cloud9 Web IDE

This is a packaging of <https://github.com/c9/core/>.

## init scripts

On startup, the container will scan the '/init' directory.
If there are any files in that directory, the container will execute them as shell scripts.

## cloud9
After successfully executing any and all init scripts, the container will start cloud9 with any user supplied options.

## docker
This image has docker installed.
However, to actually use it, you must start the container with the following tags
1. `privileged` You must use privileged or else the container will be unable to use docker and it won't work.
2. `/var/run/docker.sock:/var/run/docker.sock ` necessary for docker

An example usage is `docker run --interactive --tty --volume ${HOME}/init:/init:ro --volume /var/run/docker.sock:/var/run/docker.sock:ro emorymerryman/cloud9:4.0.0 --help`