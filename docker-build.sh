#!/usr/bin/env bash

set -e

GIT_HASH="$1"

QUAY_USERNAME="$2"

IMAGE_NAME="$3"

REGISTRY="$4"

# Check if GIT_HASH is set
if [ -z "$GIT_HASH" ]; then
    echo "GIT_HASH is not set"
    exit 1
fi

# Check if QUAY_USERNAME is set
if [ -z "$QUAY_USERNAME" ]; then
    echo "QUAY_USERNAME is not set"
    exit 1
fi

# Check if IMAGE_NAME is set
if [ -z "$IMAGE_NAME" ]; then
    echo "IMAGE_NAME is not set"
    exit 1
fi

# Check if REGISTRY is set
if [ -z "$REGISTRY" ]; then
    echo "REGISTRY is not set"
    exit 1
fi


# Build the docker image
docker build -t "$REGISTRY"/"$QUAY_USERNAME"/"$IMAGE_NAME":"$GIT_HASH" .

# List the docker images
docker images ls