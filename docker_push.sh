#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

tag="latest"
if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi

docker tag -t klabteam/klab klabteam/klab:$tag
docker push klabteam/klab:$tag
