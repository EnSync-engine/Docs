#!/bin/sh
STORAGE_DIR=/
COMPOSE_PROJECT_NAME=ensync-engine
ENSYNC_UID=$(id -u)  # Gets your UID
ENSYNC_GID=$(id -g) # Gets your UID
ENSYNC_CLEAN_UP=200
ENSYNC_CLEAN_UP_TO=200

if [ "$1" = "down" ]
then
  docker compose -f engine.yml down
else
  docker-compose -f engine.yml up -d
fi

