#!/bin/bash
set -e
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE="nginx:alpine"

docker pull ${IMAGE}

echo "Web Server is available at http://localhost:46353/"

docker container run -it --rm \
    -v ${DIR}/../public:/usr/share/nginx/html:ro \
    -p 46353:80 \
    ${IMAGE}