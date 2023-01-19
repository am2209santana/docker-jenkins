#! /bin/bash

# fail on any error
set -eu

# push the image to your docker hub repository 
docker push  $DOCKER_HUB_USERNAME/$DOCKER_HUB_REPO_NAME
