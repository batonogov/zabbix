REM Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
REM Проверка новых версий образов
docker pull mariadb:10
docker pull zabbix/zabbix-java-gateway:alpine-5.0-latest
docker pull zabbix/zabbix-server-mysql:alpine-5.0-latest
docker pull zabbix/zabbix-web-nginx-mysql:alpine-5.0-latest
REM Остановка контенеров
docker-compose down
REM Запуск контейнеров
docker-compose up --build -d
REM Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
