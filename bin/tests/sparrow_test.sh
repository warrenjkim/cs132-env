#!/usr/bin/env bats

@test "Testing ccenv sparrow s Factorial.sparrow" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset tests >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests/" >/dev/null 2>&1
  fi

  run ccenv sparrow s Factorial.sparrow
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "720" ]
}

@test "Testing ccenv sparrow s verbose Factorial.sparrow" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset tests >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests" >/dev/null 2>&1
  fi

  local out="$(find . -wholename "**/Factorial.sparrow.out" -print -quit)"
  run diff <(ccenv sparrow s verbose Factorial.sparrow) $out
  [ "$status" -eq 0 ]
}

@test "Testing ccenv sparrow sv Factorial.sparrow-v" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset tests >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests" >/dev/null 2>&1
  fi

  run ccenv sparrow sv Factorial.sparrow-v
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "720" ]
}

@test "Testing ccenv sparrow sv verbose Factorial.sparrow-v.out" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset tests >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests" >/dev/null 2>&1
  fi

  local out="$(find . -wholename "**/Factorial.sparrow-v.out" -print -quit)"
  run diff <(ccenv sparrow sv verbose Factorial.sparrow-v) $out
  [ "$status" -eq 0 ]
}
