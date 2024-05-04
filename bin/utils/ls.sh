#!/bin/sh

VERBOSE="$1"

if [[ ! -z "$VERBOSE" ]]; then
    echo "Finding the number of project roots..."
    echo "NUM_ROOTS=\"\$( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
    echo "                docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
    echo "                bash -c \"find . -type f -name 'build.gradle' | wc -l\" )\""
    echo
    echo "Listing project roots..."
    echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
    echo "  docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
    echo "  bash -c \"realpath \$(dirname \$(find . -type f -name 'build.gradle'))\" )"
fi

NUM_ROOTS="$( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "find . -type f -name 'build.gradle' | wc -l" )"

echo "====================================="
echo "Found $NUM_ROOTS project(s) mounted to /cs132."
echo "Your project(s) are:"
echo "====================================="
( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "realpath \$(dirname \$(find . -type f -name 'build.gradle'))" )

exit 0
