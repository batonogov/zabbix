source ./.env
docker exec ${DB_SERVER_HOST} mysqldump -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} > ./backup/zabbix.sql
