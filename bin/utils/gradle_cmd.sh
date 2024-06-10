#!/bin/bash

VERBOSE="$1"
HW="$3"
GRADLE_CMD="$(echo "$2" | sed s/\ "$HW\s*\$"//)"

if echo "$GRADLE_CMD" | grep -q "run"; then
    FILE_NAME="$(echo "$GRADLE_CMD" | awk '{print $(NF)}')"
    TESTCASE="testcases/$FILE_NAME"
    GRADLE_CMD="run <$TESTCASE"
fi

if [[ ! -z $VERBOSE ]]; then
  echo "Running gradle -q \"$GRADLE_CMD\" in \"$HW\"..."
  echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
  echo "  docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
  echo "  bash -c \"cd ./${HW} && gradle ${GRADLE_CMD}\" )"
  echo
fi

(cd "$CS132_ENV_BIN_DIR/docker" \
  && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && gradle -q ${GRADLE_CMD}")
