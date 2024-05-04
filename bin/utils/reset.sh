#!/bin/sh

VERBOSE="$1"

BIN_DIR="$CS132_ENV_BIN_DIR"
MOUNT_DIR="$(realpath "${2:-$CS132_ENV_MOUNT_DIR}")"

if [[ ! -z $VERBOSE ]]; then
  echo "Remember bin dir..."
  echo "BIN_DIR=\"$CS132_ENV_BIN_DIR\""
  echo
  echo "Remember mount dir..."
  echo "MOUNT_DIR=\"$CS132_ENV_MOUNT_DIR\""
  echo
  echo "Removing and restarting container..."
  echo "source ccenv remove && source \$BIN_DIR/init\" \"$MOUNT_DIR\""
fi

if [[ ! -z $VERBOSE ]]; then
  source ccenv -v remove && source "$BIN_DIR/init" "$MOUNT_DIR"
else
  source ccenv remove && source "$BIN_DIR/init" "$MOUNT_DIR"
fi

return
