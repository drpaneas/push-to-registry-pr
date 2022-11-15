# push-to-registry-pr
This is a testing repository to learn how I can push images to a registry per pull request


## How it works

1. This is a simple Go web server that listens on port 8080 and returns the git commit hash from which the source was built.
2. When you push a new commit, a GitHub action is triggered that builds a Docker image and pushes it quay.io
3. The image is tagged with the git commit hash
4. Also a minikube cluster is started and the image is deployed to it
5. The image is exposed via a NodePort service
6. We test the service by calling it with curl

This verifies that we can build images and deploy them to a cluster per commit/PR.

Note: the quay.io image is public.
