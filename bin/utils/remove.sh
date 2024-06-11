#!/bin/sh

ccenv stop

export PATH="$(echo $PATH | sed -E "s|${CS132_ENV_BIN_DIR}:||g")"
echo "\$PATH is now $PATH"
echo
echo 'Unsetting $CS132_ENV_ARCH...'
echo 'Unsetting $CS132_ENV_BIN_DIR...'
echo 'Unsetting $CS132_ENV_MOUNT_DIR...'
echo 'Unsetting $CS132_ENV_CONTAINER_NAME...'

unset CS132_ENV_ARCH
unset CS132_ENV_BIN_DIR
unset CS132_ENV_MOUNT_DIR
unset CS132_ENV_CONTAINER_NAME

return
