#!/usr/bin/env bats

@test "Testing ls with no project roots" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset noprojects >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests/noprojects" >/dev/null 2>&1
  fi

  run ccenv ls
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "=====================================" ]
  [ "${lines[1]}" = "Found 0 project(s) mounted to /cs132." ]
  [ "${lines[2]}" = "Your project(s) are:"                  ]
  [ "${lines[3]}" = "=====================================" ]
}

@test "Testing ls with five project roots" {
  if [[ -n $CS132_ENV_BIN_DIR ]]; then
    source ccenv reset projects >/dev/null 2>&1
  else
    cd ../..
    source bin/init "bin/tests/projects" >/dev/null 2>&1
  fi

  run ccenv ls
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "=====================================" ]
  [ "${lines[1]}" = "Found 5 project(s) mounted to /cs132." ]
  [ "${lines[2]}" = "Your project(s) are:"                  ]
  [ "${lines[3]}" = "=====================================" ]
  [ "${lines[4]}" = "/cs132/three"       ]
  [ "${lines[5]}" = "/cs132/one"         ]
  [ "${lines[6]}" = "/cs132/two"         ]
  [ "${lines[7]}" = "/cs132/five"        ]
  [ "${lines[8]}" = "/cs132/four"        ]
}
