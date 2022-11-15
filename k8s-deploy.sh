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


# Find the image
IMAGE="$REGISTRY"/"$QUAY_USERNAME"/"$IMAGE_NAME":"$GIT_HASH"

echo IMAGE: "$IMAGE"

# Replace the image in the deployment
awk '{sub("REPLACEME","$IMGAGE")}1' deployment.yaml > deployment.yaml

# Applying the YAML
ls
pwd
echo before
cat /home/runner/work/push-to-registry-pr/push-to-registry-pr/deployment.yaml
echo after
ls
cat /home/runner/work/push-to-registry-pr/push-to-registry-pr/deployment.yaml

