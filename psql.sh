#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: psql.sh [sql statement]" >&2
    exit 1
fi

docker exec -it rpcn-cdc-postgres-1 psql -U postgres --dbname postgres -c "$1"

