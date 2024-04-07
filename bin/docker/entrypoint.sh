#!/bin/bash

echo "This image is running an infinite loop so that the image stays alive."
echo "Consider stopping this instance (Ctrl-C) and running in detached mode by running"
echo
echo "    docker compose up -d"
echo "or"
echo "    docker stop [container_name] -t 0"
echo
echo "depending on if you ran the container using docker compose or manually, respectively."

trap 'echo "Stopping the image..."; exit 0' SIGINT

while true; do
    sleep 1
done

