echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
commit=`git rev-parse --short HEAD`
docker tag klabteam/klab klabteam/klab:$commit
echo "pushing $commit"
docker push klabteam/klab:$commit
