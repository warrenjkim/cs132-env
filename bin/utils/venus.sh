#!/bin/bash

VERBOSE="$1"
FILE_NAME="$2"

if [[ -n $VERBOSE ]]; then
  echo "Running ccenv cmd \"cd /cs132 && java -jar ./hw3/misc/venus.jar <\$(find . -name \\\"$FILE_NAME\\\" -print -quit)\""
fi

ccenv cmd "cd /cs132 && java -jar ./hw5/misc/venus.jar <\$(find /cs132 -name \"$FILE_NAME\" -print -quit)"
