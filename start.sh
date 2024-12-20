docker run -it --rm -v .:/home/seafile/seafile -p8000:8000 -p8082:8082  seafile-server

docker run -it --rm -v /home/seafile/seafile:/home/seafile/seafile -p8000:8000 -p8082:8082  seafile-server
