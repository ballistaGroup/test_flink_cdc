-- this is the source table
CREATE TABLE TEST (
    ID BIGINT,
    NAME STRING
) WITH (
	'connector' = 'kafka',
	'debezium-avro-confluent.url' = 'http://schema-registry:8081',
	'format' = 'debezium-avro-confluent',
	'properties.bootstrap.servers' = 'broker:29092',
	'properties.group.id' = 'TEST_SRC',
	'scan.startup.mode' = 'earliest-offset',
	'topic' = 'defaultServer.defaultDB.TEST_SRC'
);

--  these are the sink tables

CREATE TABLE TEST_BAD (
    ID BIGINT,
    NAME STRING,
    W_INSERT_DT TIMESTAMP(2),
    INTEGRATION_ID STRING,
    PRIMARY KEY (INTEGRATION_ID) NOT ENFORCED
) WITH (
    'connector' = 'kafka',
    'topic' = 'TEST_BAD',
    'key.avro-confluent.url' = 'http://schema-registry:8081',
    'key.fields' = 'INTEGRATION_ID',
    'key.format' = 'avro-confluent',
    'properties.bootstrap.servers' = 'broker:29092',
    'properties.group.id' = 'TEST_BAD',
    'value.format' = 'debezium-avro-confluent',
    'value.debezium-avro-confluent.url' = 'http://schema-registry:8081',
    'scan.startup.mode' = 'earliest-offset'
);

CREATE TABLE TEST_GOOD (
    ID BIGINT,
    NAME STRING,
    INTEGRATION_ID STRING,
    PRIMARY KEY (INTEGRATION_ID) NOT ENFORCED
) WITH (
    'connector' = 'kafka',
    'topic' = 'TEST_GOOD',
    'key.avro-confluent.url' = 'http://schema-registry:8081',
    'key.fields' = 'INTEGRATION_ID',
    'key.format' = 'avro-confluent',
    'properties.bootstrap.servers' = 'broker:29092',
    'properties.group.id' = 'TEST_GOOD',
    'value.format' = 'debezium-avro-confluent',
    'value.debezium-avro-confluent.url' = 'http://schema-registry:8081',
    'scan.startup.mode' = 'earliest-offset'
);