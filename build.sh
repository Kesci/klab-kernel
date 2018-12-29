#!/bin/bash
set -e
set -o pipefail

diffname=""
if [[ $TRAVIS_PULL_REQUEST = true ]]
then
	git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	git fetch
	diffname=$(git diff --name-only  origin/master)
else
	diffname=$(git diff HEAD~1 --name-only)
fi

if [[ $diffname =~ "base/Dockerfile.97" ]]
then
	echo "base gpu file changed, build it."
	( cd base && docker build -f Dockerfile.97 -t klabteam/base:gpu-latest . )
	exit 0
else
	echo "base gpu file not changed, skip it."
fi

if [[ $diffname =~ "base/klab/Dockerfile.97" ]]
then
	echo "klab gpu file changed, build it."
	( cd base/klab && docker build -f Dockerfile.97 -t klabteam/klab:gpu-latest . )
	exit 0
else
	echo "klab gpu file not changed, skip it."
fi


if [[ $diffname =~ "base/Dockerfile" ]]
then
	echo "base file changed, build it."
	( cd base && docker build -t klabteam/base . )
	exit 0
else
	echo "base file not changed, skip it."
fi

if [[ $diffname =~ "base/klab/Dockerfile" ]]
then
	echo "klab file changed, build it."
	( cd base/klab && docker build -t klabteam/klab . )
	exit 0
else
	echo "klab file not changed, skip it."
fi

