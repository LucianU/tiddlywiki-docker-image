#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Usage:"
  echo "  ./build.sh [tag]"
  echo "  Example: ./build.sh 0.1"
  exit 1
fi

# Build the Docker image
docker build . -t tiddlywiki.fat:$1

# Shrink the image with docker-slim
# The `--cmd` makes sure we can run that command on the target server
# `--mount` keeps the reference to the volume in the image, so that we can use it when deployed
docker-slim --report 'off' \
            build \
            --cmd '["--init", "server"]' \
            --mount "$(pwd)/wiki":/var/lib/tiddlywiki \
            --mount "$(pwd)/wiki":/etc/tiddlywiki \
            --target tiddlywiki.fat:$1 \
            --tag elbear/tiddlywiki:$1

# Remove the wiki directory created in the previous step
[ -d ./wiki ] && rm -r ./wiki
