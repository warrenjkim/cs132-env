#!/bin/bash

FILE_NAME="$1"

VENUS_PATH="$( ccenv cmd "find /cs132 -wholename **/**/venus.jar -print -quit" )"
ccenv cmd "cd /cs132 && java -jar $VENUS_PATH <\$(find /cs132 -wholename **/**/\"$FILE_NAME\" -print -quit)"
