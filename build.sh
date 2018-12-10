#!/bin/bash
set -e
set -o pipefail

git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch
diffname=$(git diff --name-only  origin/master)
echo "changed files $diffname"

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
        # ( cd base/klab && docker build -t klabteam/klab . )
else
	echo "klab file not changed, skip it."
fi
