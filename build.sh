#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
files=$(git diff-tree --no-commit-id --name-only -r HEAD | grep Dockerfile)
echo "modified files $files"
for file in $files ; do
	cd $(dirname $file)
	name=$(basename $(dirname $file))
	docker build -t klabteam/$name .
	docker push klabteam/$name
	cd -
done 
