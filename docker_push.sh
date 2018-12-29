#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

tag="$(git rev-parse --short HEAD)"

if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi

diffname=""
if [[ $TRAVIS_PULL_REQUEST = true ]]
then
	git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	git fetch
	diffname=$(git diff --name-only  origin/master)
else
	diffname=$(git diff --name-only HEAD~1)
fi

if [[ $diffname =~ "base/Dockerfile.97" ]]
then
	echo "base gpu file changed, push it."
	docker tag  klabteam/base:gpu-latest klabteam/base:gpu-$tag
	docker push klabteam/base:gpu-$tag
	docker push klabteam/base:gpu-latest
	exit 0
else
	echo "base gpu file not changed, skip it."
fi

if [[ $diffname =~ "base/klab/Dockerfile.97" ]]
then
	echo "klab gpu file changed, push it."
	docker tag  klabteam/klab:gpu-latest klabteam/klab:gpu-$tag
	docker push klabteam/klab:gpu-$tag
	docker push klabteam/klab:gpu-latest
	exit 0
else
	echo "klab gpu file not changed, skip it."
fi

if [[ $diffname =~ "base/Dockerfile" ]]
then
	echo "base file changed, push it."
	docker tag  klabteam/base klabteam/base:$tag
	docker push klabteam/base:$tag
	docker push klabteam/base:latest
	exit 0
else
	echo "base file not changed, skip it."
fi

if [[ $diffname =~ "base/klab/Dockerfile" ]]
then
	echo "klab file changed, push it."
	docker tag  klabteam/klab klabteam/klab:$tag
	docker push klabteam/klab:$tag
	docker push klabteam/klab:latest
	exit 0
else
	echo "klab file not changed, skip it."
fi
