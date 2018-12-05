#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

tag="$(git rev-parse --short HEAD)"

if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi

docker tag  klabteam/base klabteam/base:$tag
docker push klabteam/base:$tag

docker tag  klabteam/klab klabteam/klab:$tag
docker push klabteam/klab:$tag
