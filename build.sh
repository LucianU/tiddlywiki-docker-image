#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Usage:"
  echo "  ./build.sh [tag]"
  echo "  Example: ./build.sh 0.1"
  exit 1
fi

# Build the Docker image
docker build . -t elbear/tiddlywiki:$1

