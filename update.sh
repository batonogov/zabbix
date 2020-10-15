db=mariadb:10
gateway=zabbix-java-gateway:alpine-5.0-latest
server=zabbix-server-mysql:alpine-5.0-latest
nginx=zabbix-web-nginx-mysql:alpine-5.0-latest


# Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
# Проверка новых версий образов
docker pull $db
docker pull zabbix/$gateway
docker pull zabbix/$server
docker pull zabbix/$nginx
# Остановка контенеров
docker-compose down
# Запуск контейнеров
docker-compose up --build -d
# Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
