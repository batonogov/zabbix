REM Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
REM Проверка новых версий образов
docker pull localhost:5000/mariadb:10
docker pull localhost:5000/zabbix-java-gateway:alpine-5.0-latest
docker pull localhost:5000/zabbix-server-mysql:alpine-5.0-latest
docker pull localhost:5000/zabbix-web-nginx-mysql:alpine-5.0-latest
docker pull localhost:5000/zabbix-backup
REM Остановка контенеров
docker-compose down
REM Запуск контейнеров
docker-compose --file docker-compose-local.yml up -d
REM Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
pause
