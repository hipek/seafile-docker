#!/bin/bash

# Start script
/home/seafile/seafile/seafile-start-stop.sh start

# Stop script
stop_script() {
    /home/seafile/seafile/seafile-start-stop.sh stop
    exit 0
}

# Wait for supervisor to stop script
trap stop_script SIGINT SIGTERM

while true
do
    sleep 1
done

