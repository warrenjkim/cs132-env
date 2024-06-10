#!/bin/bash

VERBOSE="$1"
TYPE="$2"
OPTIONS="$3"
FILE_NAME="$4"

if [[ ! -n $FILE_NAME ]]; then
  FILE_NAME="$OPTIONS"
  OPTIONS=""
fi

if [[ -n $VERBOSE ]]; then
  echo "Running ccenv cmd \"cd /cs132 && java -jar ./hw3/misc/sparrow.jar $TYPE $OPTIONS <\$(find . -name \\\"$FILE_NAME\\\" -print -quit)\""
fi
ccenv cmd "cd /cs132 && java -jar ./hw3/misc/sparrow.jar $TYPE $OPTIONS <\$(find /cs132 -name \"$FILE_NAME\" -print -quit)"

