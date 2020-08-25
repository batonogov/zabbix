docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
docker pull mariadb:10
docker pull zabbix/zabbix-java-gateway:alpine-5.0-latest
docker pull zabbix/zabbix-server-mysql:alpine-5.0-latest
docker pull zabbix/zabbix-web-nginx-mysql:alpine-5.0-latest
docker-compose down
docker-compose rm
docker-compose up --build -d
docker exec zabbix-backup bash restoredb.sh
