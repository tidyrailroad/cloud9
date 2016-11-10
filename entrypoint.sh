#!/bin/sh

mkdir ${HOME}/bin &&
    echo -en "#!/bin/sh\n\n${PROJECT_COMMAND}" >> ${HOME}/bin/shell.sh &&
    chmod 0500 ${HOME}/bin/shell.sh &&
    chsh -s ${HOME}/bin/shell.sh root &&
    chsh -s ${HOME}/bin/shell.sh &&
    node /opt/cloud9/c9sdk/server.js --listen 0.0.0.0 --auth user:password -p 8080 -w /usr/local/src/${PROJECT_NAME} &&
    true