# Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
# Остановка контенеров
docker-compose down
docker-compose rm
# Запуск контейнеров
docker-compose --file docker-compose-local.yml up -d
# Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
