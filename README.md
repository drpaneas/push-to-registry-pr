# push-to-registry-pr
This is a testing repository to learn how I can push images to a registry per pull request


## How to use

## Build

```bash
# Inside GitHub Actions
./docker-build.sh "${{ env.IMAGE_TAG }}" "${{ env.USERNAME }}" "${{ env.IMAGE_NAME }}" "${{ env.REGISTRY }}"
```

# Locally
./docker-build.sh $(git rev-parse HEAD) pgeorgia push-to-registry-pr quay.io
```

### Run

```bash
docker run --rm --publish 8081:8081 push-to-registry-pr:$(git rev-parse HEAD)
```

Test:

```bash
$ curl localhost:8081
Webserver build commit: "1676991a948a61bb0fb9aa37800c36c3f7150b7e"%
```
