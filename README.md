# The Cloud9 Web IDE

This is a packaging of <https://github.com/c9/core/>.

The two user supplied parameters are

## Parameters
1. `PROJECT_NAME` (required) This is an environment variable that will control the name of the workspace.
2. `PROJECT_COMMAND` (required) This is an environment variable that determines how a shell is run.
3. `/workspace` (optional) This is a mounted volume that becomes the workspace of the project.

## Non parameters
1. `privileged` You must use privileged or else the container will be unable to use docker and it won't work.
2. `/var/run/docker.sock:/var/run/docker.sock ` necessary for docker

An example usage is in alpine.sh