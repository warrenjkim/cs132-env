#!/bin/sh

BIN_DIR="$CS132_ENV_BIN_DIR"
MOUNT_DIR="$(realpath "${1:-$CS132_ENV_MOUNT_DIR}")"

source ccenv remove && source "$BIN_DIR/init" "$MOUNT_DIR"

return
