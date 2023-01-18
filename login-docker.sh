#! /bin/bash

# fail on any error
set -eu

# login to your dockerhub account
docker login --username  $DOCKER_HUB_USERNAME --password $DOCKER_HUB_PASSWORD