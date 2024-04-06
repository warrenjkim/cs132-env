#!/bin/bash

echo "This image is running 'tail -f /dev/null' so that the image stays alive."
echo "Consider stopping this instance (Ctrl-C) and running in detached mode by running"
echo
echo "    docker compose up -d"

exec tail -f /dev/null
