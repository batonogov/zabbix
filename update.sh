docker exec zabbix-backup bash touch /var/log/etc/update-$(date +"%Y-%m-%d").log
docker exec zabbix-backup bash /cron.daily/backupdb.sh >> /var/log/etc/update-$(date +"%Y-%m-%d").log 2>&1;
docker pull mysql:8.0
docker pull zabbix/zabbix-java-gateway:alpine-5.0-latest
docker pull zabbix/zabbix-server-mysql:alpine-5.0-latest
docker pull zabbix/zabbix-web-nginx-mysql:alpine-5.0-latest
docker-compose down
docker-compose rm
docker-compose up --build -d
sleep 60
docker exec zabbix-backup bash restoredb.sh >> /var/log/etc/update-$(date +"%Y-%m-%d").log 2>&1;
