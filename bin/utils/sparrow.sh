#!/bin/bash

TYPE="$1"
OPTIONS="$2"
FILE_NAME="$3"
SPARROW_PATH="$( ccenv cmd "find /cs132 -wholename **/**/sparrow.jar -print -quit")"

if [[ ! -n $FILE_NAME ]]; then
  FILE_NAME="$OPTIONS"
  OPTIONS=""
fi

ccenv cmd "cd /cs132 && java -jar $SPARROW_PATH $TYPE $OPTIONS <\$(find /cs132 -wholename **/**/\"$FILE_NAME\" -print -quit)"
