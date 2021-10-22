#!/bin/bash

echo "Stop and remove network..."
docker-compose down -v
docker-compose rm -sfv
docker network rm besu-tester

echo "remove database files..."
for i in `seq 0 3`; do
    if [ -d node${i}/data/caches ]; then
        rm -rf node${i}/data/caches
    fi
    if [ -d node${i}/data/database ]; then
        rm -rf node${i}/data/database
    fi
    if [ -e node${i}/data/DATABASE_METADATA.json ]; then
        rm node${i}/data/DATABASE_METADATA.json
    fi
done