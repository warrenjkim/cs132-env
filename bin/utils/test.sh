#!/bin/bash

VERBOSE="$1"
HW="$3"
FILE_NAME="$2"

TESTCASE="testcases/$FILE_NAME"
GRADLE_CMD="run <$TESTCASE"

function straight_diff() {
  if [[ ! -z $VERBOSE ]]; then
    echo "Running gradle -q \"$GRADLE_CMD\" in \"$HW\"..."
    echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
    echo "  docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
    echo "  bash -c \"cd ./${HW} && diff_output=\\\$(diff <(gradle -q ${GRADLE_CMD}) ${TESTCASE}.out); exit_status=\\\$?; \\"
    echo "            if [ \\\$exit_status -eq 0 ]; then \\"
    echo "                echo -e '${FILE_NAME}: \033[32mPassed\033[0m'; \\"
    echo "            else \\"
    echo "                echo -e '${FILE_NAME}: \033[31mFailed\033[0m'; \\"
    echo "                echo -e '\033[33mDifferences:\033[0m'; \\"
    echo "                echo \"\\\$diff_output\"; \\"
    echo "            fi\")"
    echo
  fi

  (cd "$CS132_ENV_BIN_DIR/docker" \
    && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && diff_output=\$(diff <(gradle -q ${GRADLE_CMD}) ${TESTCASE}.out); exit_status=\$?; \
      if [ \$exit_status -eq 0 ]; then \
          echo -e '${FILE_NAME}: \033[32mPassed\033[0m'; \
      else \
          echo -e '${FILE_NAME}: \033[31mFailed\033[0m'; \
          echo -e '\033[33mDifferences:\033[0m'; \
          echo \"\$diff_output\"; \
      fi")
}

function jar_diff() {
  if [[ ! -z $VERBOSE ]]; then
    echo "Running gradle -q \"$GRADLE_CMD\" in \"$HW\"..."
    echo "( cd \"$CS132_ENV_BIN_DIR/docker\" && \\"
    echo "  docker compose exec \"$CS132_ENV_CONTAINER_NAME\" \\"
    echo "  bash -c \"cd ./${HW} && diff_output=\\\$(diff <(gradle -q ${GRADLE_CMD} | java -jar ./misc/$1 $2) ${TESTCASE}.out); exit_status=\\\$?; \\"
    echo "            if [ \\\$exit_status -eq 0 ]; then \\"
    echo "                echo -e '${FILE_NAME}: \033[32mPassed\033[0m'; \\"
    echo "            else \\"
    echo "                echo -e '${FILE_NAME}: \033[31mFailed\033[0m'; \\"
    echo "                echo -e '\033[33mDifferences:\033[0m'; \\"
    echo "                echo \"\\\$diff_output\"; \\"
    echo "            fi\")"
    echo
  fi

  (cd "$CS132_ENV_BIN_DIR/docker" \
    && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && diff_output=\$(diff <(gradle -q ${GRADLE_CMD} | java -jar ./misc/$1 $2) ${TESTCASE}.out); exit_status=\$?; \
      if [ \$exit_status -eq 0 ]; then \
          echo -e '${FILE_NAME}: \033[32mPassed\033[0m'; \
      else \
          echo -e '${FILE_NAME}: \033[31mFailed\033[0m'; \
          echo -e '\033[33mDifferences:\033[0m'; \
          echo \"\$diff_output\"; \
      fi")
}

case "$HW" in
  hw1)
    straight_diff
    ;;
  hw2)
    straight_diff
    ;;
  hw3)
    jar_diff "sparrow.jar" "s"
    ;;
  hw4)
    jar_diff "sparrow.jar" "sv"
    ;;
  hw5)
    jar_diff "venus.jar" ""
    ;;
esac
