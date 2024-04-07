#!/bin/bash

echo "This image is running an infinite loop so that the image stays alive."
echo "Consider stopping this instance (Ctrl-C) and running in detached mode by running"
echo
echo "    docker compose up -d"

trap 'echo "Stopping the image..."; exit 0' SIGINT

while true; do
    sleep 1
done

