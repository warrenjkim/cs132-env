#!/bin/sh

VERBOSE="$1"
SH_CMD="$2"

if [[ ! -z "$VERBOSE" ]]; then # verbose logging.
    echo "Running cmd \"$SH_CMD\"..."
    echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
    echo "  docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
    echo "  bash -c \"$SH_CMD\" )"
    echo
fi

( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "$SH_CMD" )
