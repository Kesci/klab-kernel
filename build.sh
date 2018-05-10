#!/bin/bash
git diff-tree --no-commit-id --name-only -r HEAD
git diff --name-only --diff-filter=AM HEAD...$TRAVIS_BRANCH
files=$(git diff-tree --no-commit-id --name-only -r HEAD | grep Dockerfile)
file=$(git diff --name-only --diff-filter=AM HEAD...$TRAVIS_BRANCH)
echo "modified files $files"
for file in $files ; do
	cd $(dirname $file)
	name=$(basename $(dirname $file))
	docker build -t klabteam/$name .
	cd -
done 
