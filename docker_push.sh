#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
commit=`git rev-parse --short HEAD`
files=$(git diff-tree --no-commit-id --name-only -r HEAD | grep Dockerfile)
echo "commit $commit"
echo "modified files $files"
tag="latest"
if [ "$1" == "tags" ]; then
	tag=$(git describe --abbrev=0 --tags)
fi
for file in $files ; do
	cd $(dirname $file)
	name=$(basename $(dirname $file))
	docker tag -t klabteam/$name klabteam/$name:$tag
        docker push klabteam/$name:$tag
	cd -
done
