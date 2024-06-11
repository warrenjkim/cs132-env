#!/bin/bash

HW="$1"
FILE_NAME="$2"
TESTCASE="$(ccenv cmd "find /cs132 -wholename **/**/${FILE_NAME} -print -quit" )"

(cd "$CS132_ENV_BIN_DIR/docker" \
  && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && gradle -q run <${TESTCASE}")
