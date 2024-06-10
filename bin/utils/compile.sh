#!/bin/bash
VERBOSE="$1"
FILE_NAME="$2"


if [[ -n $VERBOSE ]]; then
echo "Running ccenv test hw2/$FILE_NAME hw2"
fi
ccenv test hw2/$FILE_NAME hw2

if [[ -n $VERBOSE ]]; then
  echo "Running ccenv cmd \"cd /cs132/hw3 && gradle -q run <\$(find /cs132 -name \"$FILE_NAME\" -print -quit) >/cs132/hw4/testcases/hw4/translated.sparrow\""
fi
ccenv cmd "cd /cs132/hw3 && gradle -q run <\$(find /cs132 -name \"$FILE_NAME\" -print -quit) >/cs132/hw4/testcases/hw4/translated.sparrow"
ccenv test hw3/$FILE_NAME hw3

if [[ -n $VERBOSE ]]; then
  echo "Running ccenv cmd \"cd /cs132/hw4 && gradle -q run <testcases/hw4/translated.sparrow >/cs132/hw5/testcases/hw5/allocated.sparrow-v\""
fi
ccenv cmd "cd /cs132/hw4 && gradle -q run <testcases/hw4/translated.sparrow >/cs132/hw5/testcases/hw5/allocated.sparrow-v"

if [[ -n $VERBOSE ]]; then
  echo "Running ccenv cmd \"cd /cs132/hw5 && gradle -q run <testcases/hw5/allocated.sparrow-v >/cs132/hw5/testcases/hw5/compiled.riscv\""
fi
ccenv cmd "cd /cs132/hw5 && gradle -q run <testcases/hw5/allocated.sparrow-v >/cs132/$(basename $FILE_NAME .java).riscv"

echo "$FILE_NAME Compiled successfully. To run the program, run"
echo "ccenv venus $(basename $FILE_NAME .java).riscv"
