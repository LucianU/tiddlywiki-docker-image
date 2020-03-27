#!/usr/bin/env bash

# Build the Docker image
docker build . -t tiddlywiki.fat:$1

# Shrink the image with docker-slim
# The `--cmd` makes sure we can run that command on the target server
# `--mount` keeps the reference to the volume in the image, so that we can use it when deployed
docker-slim --report 'off' build --cmd '["--init", "server"]' --mount "$(pwd)/wiki":/var/lib/tiddlywiki --target tiddlywiki.fat:$1 --tag elbear/tiddlywiki:$1

# Remove the wiki directory created in the previous step
[ -d ./wiki ] && rm -r ./wiki