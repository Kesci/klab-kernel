#!/bin/bash
set -e
set -o pipefail

diffname=""
echo "$TRAVIS_PULL_REQUEST"
if [[ $TRAVIS_PULL_REQUEST ]]
then
	git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	git fetch
	diffname=$(git diff --name-only  origin/master)
else
	diffname=$(diff HEAD~1 --name-only)
	echo "$diffname"
fi

if [[ $diffname =~ "base/Dockerfile" ]]
then
	echo "base file changed, build it."
	( cd base && docker build -t klabteam/base . )
else
	echo "base file not changed, skip it."
fi
if [[ $diffname =~ "base/klab/Dockerfile" ]]
then
	echo "klab file changed, build it."
	#( cd base/klab && docker build -t klabteam/klab . )
else
	echo "klab file not changed, skip it."
fi

