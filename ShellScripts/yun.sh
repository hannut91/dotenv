#! /bin/bash

# Docker
function removeDockerContainers {
    cid=$(docker container ls -a | sed 1d | fzf -m -q "$1" | awk '{print $1}')
    docker container rm ${cid// /\\n} -f
}

function removeDockerImages {
    cid=$(docker image ls -a | sed 1d | fzf -m -q "$3" | awk '{print $3}')
    docker image rm ${cid// /\\n} -f
}

function startDockerContainer {
    cid=$(docker container ls -a --format {{.Names}} | fzf)
    docker start $cid
}

# Carbon
function carbon {
    echo "language:"
    read input
    command carbon-now -l ~/Desktop --from-clipboard -h -p $input
}

function getCommands {
    echo "docker exec -it local-mariadb bash"
    echo "bundle exec jekyll serve"
    echo "removeDockerContainers"
    echo "removeDockerImages"
    echo "startDockerContainer"
    echo "fgst"
    echo "carbon"
}

$(getCommands | fzf);

