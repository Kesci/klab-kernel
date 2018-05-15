#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

tag="latest"

if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi

if [ "$1" == "gpu-master" ]; then
	tag="latest-gpu"
fi


docker tag  klabteam/klab klabteam/klab:$tag
docker push klabteam/klab:$tag
