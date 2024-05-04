#!/bin/sh

VERBOSE="$1"

if [[ ! -z $VERBOSE ]]; then
  echo "Removing container..."
  echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && docker compose down -v -t 0 )"
fi

(cd "$CS132_ENV_BIN_DIR/docker" && docker compose down -v -t 0)

if [[ ! -z $VERBOSE ]]; then
  echo "Removing $CS132_ENV_BIN_DIR from \$PATH..."
fi

export PATH="$(echo $PATH | sed -E "s|${CS132_ENV_BIN_DIR}:||g")"

if [[ ! -z $VERBOSE ]]; then
  echo "\$PATH is now $PATH"
  echo
  echo 'Unsetting $CS132_ENV_ARCH...'
  echo 'Unsetting $CS132_ENV_BIN_DIR...'
  echo 'Unsetting $CS132_ENV_MOUNT_DIR...'
  echo 'Unsetting $CS132_ENV_CONTAINER_NAME...'
fi

unset CS132_ENV_ARCH
unset CS132_ENV_BIN_DIR
unset CS132_ENV_MOUNT_DIR
unset CS132_ENV_CONTAINER_NAME

return
