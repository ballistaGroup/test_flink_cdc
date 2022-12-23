-- Create a root user
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- Create a user that will be used by Debezium
CREATE USER IF NOT EXISTS 'debezium-user'@'%' IDENTIFIED BY 'debezium-user-pw';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium-user' IDENTIFIED BY 'debezium-user-pw';

-- Don't forget to flush...
FLUSH PRIVILEGES;
