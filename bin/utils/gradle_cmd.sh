#!/bin/bash

HW="$1"
GRADLE_CMD="$(echo "$2" | sed s/\ "$HW\s*\$"//)"  # strip the hw

if echo "$GRADLE_CMD" | grep -q "run"; then  # if gradle run, take the filename
    FILE_NAME="$(echo "$GRADLE_CMD" | awk '{print $(NF)}')"
    ccenv run "$HW" "$FILE_NAME"
    exit 0
fi

(cd "$CS132_ENV_BIN_DIR/docker" \
  && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && gradle -q ${GRADLE_CMD}")
