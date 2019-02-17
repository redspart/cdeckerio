#!/bin/bash
set -e
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USER_ID=$(id -u ${USER})
GROUP_ID=$(id -g ${USER})
IMAGE="mysocialobservations/docker-tdewolff-minify"

docker run --rm \
    -u ${USER_ID}:${GROUP_ID} \
    -v ${DIR}/../:/src \
    -w /src \
    ${IMAGE} \
        minify --recursive --verbose \
            --match=\.*.js$ \
            --type=js \
            --output public/ \
            public/

docker run --rm \
    -u ${USER_ID}:${GROUP_ID} \
    -v ${DIR}/../:/src \
    -w /src \
    ${IMAGE} \
        minify --recursive --verbose \
            --match=\.*.css$ \
            --type=css \
            --output public/ \
            public/

docker run --rm \
    -u ${USER_ID}:${GROUP_ID} \
    -v ${DIR}/../:/src \
    -w /src \
    ${IMAGE} \
        minify --recursive --verbose \
            --match=\.*.html$ \
            --type=html \
            --output public/ \
            public/