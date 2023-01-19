#! /bin/bash

# fail on any error
set -eu

# push the image to your docker hub repository 
docker push $IMAGE_TAG
