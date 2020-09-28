REM Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
REM Остановка контенеров
docker-compose down
REM Запуск контейнеров
docker-compose --file docker-compose-local.yml up -d
REM Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
