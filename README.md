# Docker image builder for seafile

## Builder docker image

	./build.sh

## Download and decompress seafile server

    mkdir ~/seafile
    cd seafile
    wget https://s3.eu-central-1.amazonaws.com/download.seadrive.org/seafile-server_10.0.1_x86-64.tar.gz
    tar xf seafile-server_10.0.1_x86-64.tar.gz

## Copy start script

    cp ~/seafile-docker/seafile.sh ~/seafile/seafile-server-latest
    
## Initial setup

    docker run -it --rm -v /home/seafile/seafile:/home/seafile/seafile seafile-server /bin/bash
    ./setup-seafile.sh
    

## Start container

    docker run -d --restart unless-stopped -v /home/seafile/seafile:/home/seafile/seafile \
            -p8000:8000 -p8082:8082 --name seafile  seafile-server
            
