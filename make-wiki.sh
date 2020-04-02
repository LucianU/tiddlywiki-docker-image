#!/usr/bin/env bash

# We can use this wiki to test that the Tiddlywiki container can properly serve
# a wiki.

if [ -z "$1" ]
then
  echo "Usage:"
  echo "  ./make_image.sh [image]"
  echo "  Example: ./make-image.sh elbear/tiddlywiki:0.2"
  exit 1
fi

mkdir -p wiki
docker run --rm -it -v "$(pwd)"/wiki:/var/lib/tiddlywiki "$1" --init server

(
cat <<HERE
username,password
lucian,averyweakpassword
HERE
) > wiki/users.csv

