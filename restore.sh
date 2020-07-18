source ./.env
cat ./backup/zabbix.sql | docker exec -i ${DB_SERVER_HOST} mysql -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE}
