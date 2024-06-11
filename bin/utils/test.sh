#!/bin/bash

HW="$1"
IN_FILE="$2"
OUT_FILE="$3"

TESTCASE="$( ccenv cmd "find /cs132 -wholename **/$IN_FILE -print -quit" )"
TESTCASE_OUT="$( ccenv cmd "find /cs132 -wholename **/$OUT_FILE -print -quit" )"

function straight_diff() {
  (cd "$CS132_ENV_BIN_DIR/docker" \
    && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && diff_output=\$(diff <(gradle -q run <${TESTCASE}) ${TESTCASE_OUT}); \
      if [ \$? -eq 0 ]; then \
          echo -e '${TESTCASE}: \033[32mPassed\033[0m'; \
      else \
          echo -e '${TESTCASE}: \033[31mFailed\033[0m'; \
          echo -e '\033[33mDifferences:\033[0m'; \
          echo \"\$diff_output\"; \
      fi")
}

function jar_diff() {
  (cd "$CS132_ENV_BIN_DIR/docker" \
    && docker compose exec "$CS132_ENV_CONTAINER_NAME" \
    bash -c "cd ./${HW} && diff_output=\$(diff <(gradle -q run <${TESTCASE} | java -jar ./misc/$1 $2) ${TESTCASE_OUT}); \
      if [ \$? -eq 0 ]; then \
          echo -e '${TESTCASE}: \033[32mPassed\033[0m'; \
      else \
          echo -e '${TESTCASE}: \033[31mFailed\033[0m'; \
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
    jar_diff "venus.jar"
    ;;
esac
