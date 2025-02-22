#!/bin/sh
STORAGE_DIR=/ # This should be declared before container execution as it would be needed to mount volume
COMPOSE_PROJECT_NAME=ensync-engine
ENSYNC_UID=$(id -u)  #Optional Ish - Gets your UID # This should be declared before container execution and would only be needed when launching EnSync on a strict Linux server
ENSYNC_GID=$(id -g) #Optional Ish - Gets your UID # This should be declared before container execution time and would only be needed when launching EnSync on a strict Linux server
ENSYNC_CLEAN_UP=200 # Optional - How often do you want EnSync to clean up it's Ready-to-go Queue
ENSYNC_CLEAN_UP_TO=200 # Optional - Oldest data supported in the Ready-to-go Queue

if [ "$1" = "down" ]
then
  docker compose -f engine.yml down
else
  docker-compose -f engine.yml up -d
fi

