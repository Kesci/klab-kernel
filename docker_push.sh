#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

tag="$(git rev-parse --short HEAD)"

if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi

if [[ $diffname =~ "base/Dockerfile" ]]
then
	echo "base file changed, push it."
	( cd base && docker build -t klabteam/base . )
        docker tag  klabteam/base klabteam/base:$tag
        docker push klabteam/base:$tag
        docker push klabteam/base:latest
else
	echo "base file not changed, skip it."
fi

if [[ $diffname =~ "base/klab/Dockerfile" ]]
then
	echo "klab file changed, push it."
        docker tag  klabteam/klab klabteam/klab:$tag
        docker push klabteam/klab:$tag
        docker push klabteam/klab:latest
else
	echo "klab file not changed, skip it."
fi
