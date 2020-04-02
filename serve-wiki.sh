#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Usage:"
  echo "  ./serve-wiki.sh [image]"
  echo "  Example: ./serve-wiki.sh elbear/tiddlywiki:0.2"
  exit 1
fi

docker run --rm -v "$(pwd)"/wiki:/var/lib/tiddlywiki -v "$(pwd)"/wiki:/etc/tiddlywiki -p 8080:8080 $1
