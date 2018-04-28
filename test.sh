DIR="/test"
docker run -v $PWD/test:$DIR:rw klabteam/klab /bin/bash -c "cd $DIR && ./test.sh"
