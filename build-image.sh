#! /bin/bash

# fail on any error
set -eu

# build the docker image
docker build -t $IMAGE_TAG .
