#!/bin/sh

NUM_ROOTS="$( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "find . -type f -name 'build.gradle' | wc -l" )"

echo "====================================="
echo "Found $NUM_ROOTS project(s) mounted to /cs132."
echo "Your project(s) are:"
echo "====================================="
( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "realpath \$(dirname \$(find . -type f -name 'build.gradle') 2>/dev/null) 2>/dev/null" )

exit 0
