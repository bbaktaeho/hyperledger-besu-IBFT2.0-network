#!/bin/sh

echo "Starting network..."
docker-compose build --pull
docker-compose up --detach