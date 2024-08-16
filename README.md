# Redpanda Connect CDC Demo

This demo shows an architecture of a standalone Debezium Server replicating
change events from a PostgreSQL database to a Redpanda Connect instance
that sinks the data to `stdout` (for now).

## Required
- `docker` w/ compose
- `jq` (optional, but handy)

## Running

In one terminal:

```sh
docker compose up
```

You can tail the Redpanda Connect logs (in json) in another terminal:

```sh
docker logs -f rpcn-cdc-rpcn-1 | jq
```

Now insert some data into one of the tables using the helper script:

```sh
./psql.sh "INSERT INTO films (code, title, did) VALUES ('a', 'Troll 2', 1234);"
```

> note: code is set up as a primary key at the moment

