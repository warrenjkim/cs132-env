#!/bin/sh

SH_CMD="$1"

( cd "$CS132_ENV_BIN_DIR/docker" && \
    docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "$SH_CMD" )
