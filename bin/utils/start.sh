#!/bin/bash

( cd "$CS132_ENV_BIN_DIR/docker" && docker compose up -d --pull always )

exit 0
