#!/bin/sh

curl --request POST \
    --url "http://localhost:8083/connectors" \
    --header 'content-type: application/json' \
    --data '{
    "name": "obianew-connector",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "database.hostname": "mysql",
        "database.port": "3306",
        "database.user": "debezium-user",
        "database.password": "debezium-user-pw",
        "database.server.id": "184054",
        "database.server.name": "defaultServer",
        "database.include.list": "defaultDB",
        "database.history.kafka.bootstrap.servers": "broker:29092",
        "database.history.kafka.topic": "dbhistory-defaultServer",
        "include.schema.changes": "false"
    }
}'