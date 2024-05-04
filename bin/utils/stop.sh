#!/bin/sh

VERBOSE="$1"

if [[ ! -z $VERBOSE ]]; then
  echo "Stopping container..."
  echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && docker compose stop -t 0 )"
fi

(cd "$CS132_ENV_BIN_DIR/docker" && docker compose stop -t 0)

exit 0
