#!/bin/bash

VERBOSE="$1"

if [[ ! -z $VERBOSE ]]; then
  echo "Starting container..."
  echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && docker compose up -d )"
fi

(cd "$CS132_ENV_BIN_DIR/docker" && docker compose up -d)

exit 0
