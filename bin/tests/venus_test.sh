#!/usr/bin/env bats

@test "Testing ccenv venus Factorial.riscv" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset tests >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests" >/dev/null 2>&1
  fi

  run ccenv venus Factorial.riscv
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "720" ]
}
