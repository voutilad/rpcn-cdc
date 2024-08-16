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

## Output

For the above, you should get something similar to:

```json
{
    "schema": {
        "type": "struct",
        "fields": [
            {
                "type": "struct",
                "fields": [
                    {
                        "type": "string",
                        "optional": false,
                        "field": "code"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "title"
                    },
                    {
                        "type": "int32",
                        "optional": false,
                        "field": "did"
                    },
                    {
                        "type": "int32",
                        "optional": true,
                        "name": "io.debezium.time.Date",
                        "version": 1,
                        "field": "date_prod"
                    },
                    {
                        "type": "string",
                        "optional": true,
                        "field": "kind"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "name": "io.debezium.time.MicroDuration",
                        "version": 1,
                        "field": "len"
                    }
                ],
                "optional": true,
                "name": "movies.public.films.Value",
                "field": "before"
            },
            {
                "type": "struct",
                "fields": [
                    {
                        "type": "string",
                        "optional": false,
                        "field": "code"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "title"
                    },
                    {
                        "type": "int32",
                        "optional": false,
                        "field": "did"
                    },
                    {
                        "type": "int32",
                        "optional": true,
                        "name": "io.debezium.time.Date",
                        "version": 1,
                        "field": "date_prod"
                    },
                    {
                        "type": "string",
                        "optional": true,
                        "field": "kind"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "name": "io.debezium.time.MicroDuration",
                        "version": 1,
                        "field": "len"
                    }
                ],
                "optional": true,
                "name": "movies.public.films.Value",
                "field": "after"
            },
            {
                "type": "struct",
                "fields": [
                    {
                        "type": "string",
                        "optional": false,
                        "field": "version"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "connector"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "name"
                    },
                    {
                        "type": "int64",
                        "optional": false,
                        "field": "ts_ms"
                    },
                    {
                        "type": "string",
                        "optional": true,
                        "name": "io.debezium.data.Enum",
                        "version": 1,
                        "parameters": {
                            "allowed": "true,last,false,incremental"
                        },
                        "default": "false",
                        "field": "snapshot"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "db"
                    },
                    {
                        "type": "string",
                        "optional": true,
                        "field": "sequence"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "field": "ts_us"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "field": "ts_ns"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "schema"
                    },
                    {
                        "type": "string",
                        "optional": false,
                        "field": "table"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "field": "txId"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "field": "lsn"
                    },
                    {
                        "type": "int64",
                        "optional": true,
                        "field": "xmin"
                    }
                ],
                "optional": false,
                "name": "io.debezium.connector.postgresql.Source",
                "field": "source"
            },
            {
                "type": "struct",
                "fields": [
                    {
                        "type": "string",
                        "optional": false,
                        "field": "id"
                    },
                    {
                        "type": "int64",
                        "optional": false,
                        "field": "total_order"
                    },
                    {
                        "type": "int64",
                        "optional": false,
                        "field": "data_collection_order"
                    }
                ],
                "optional": true,
                "name": "event.block",
                "version": 1,
                "field": "transaction"
            },
            {
                "type": "string",
                "optional": false,
                "field": "op"
            },
            {
                "type": "int64",
                "optional": true,
                "field": "ts_ms"
            },
            {
                "type": "int64",
                "optional": true,
                "field": "ts_us"
            },
            {
                "type": "int64",
                "optional": true,
                "field": "ts_ns"
            }
        ],
        "optional": false,
        "name": "movies.public.films.Envelope",
        "version": 2
    },
    "payload": {
        "before": null,
        "after": {
            "code": "a    ",
            "title": "Troll 2",
            "did": 1234,
            "date_prod": null,
            "kind": null,
            "len": null
        },
        "source": {
            "version": "2.7.1.Final",
            "connector": "postgresql",
            "name": "movies",
            "ts_ms": 1723824732782,
            "snapshot": "false",
            "db": "postgres",
            "sequence": "[\"23533520\",\"23533576\"]",
            "ts_us": 1723824732782263,
            "ts_ns": 1723824732782263000,
            "schema": "public",
            "table": "films",
            "txId": 494,
            "lsn": 23533576,
            "xmin": null
        },
        "transaction": null,
        "op": "c",
        "ts_ms": 1723824733094,
        "ts_us": 1723824733094897,
        "ts_ns": 1723824733094897000
    }
}
```