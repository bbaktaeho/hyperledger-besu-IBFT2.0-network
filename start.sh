#!/bin/sh

NO_LOCK_REQUIRED=true

docker-compose -p besu-private-net-ibft down
docker-compose build --pull
docker-compose -p besu-private-net-ibft up -d