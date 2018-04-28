echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
commit=`git rev-parse --short HEAD`
if [ $1 == "master" ]; then
    echo "pushing latest"
    docker push klabteam/klab:latest
else
    docker tag klabteam/klab klabteam/klab:$commit
    echo "pushing $commit"
    docker push klabteam/klab:$commit
fi
