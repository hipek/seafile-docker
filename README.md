# Docker image builder for seafile

## Builder docker image

	./build.sh

## Start container

    docker run -d --restart unless-stopped -v /home/seafile/seafile:/home/seafile/seafile \
            -p8000:8000 -p8082:8082 --name seafile  seafile-server
