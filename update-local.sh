# Весия Zabbix (5.0 или 5.2)
version=5.0

echo Zabbix $version

# Присваивание названий образов переменным
db=mariadb:10
gateway=zabbix-java-gateway:alpine-$version-latest
server=zabbix-server-mysql:alpine-$version-latest
nginx=zabbix-web-nginx-mysql:alpine-$version-latest
backup=zabbix-backup

# Присваивание параметров переменным
registryport=5000
host=localhost:$registryport

# Резервное копирование базы данных
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
# Проверка новых версий образов
docker pull $host/$db 
docker pull $host/$gateway
docker pull $host/$server
docker pull $host/$nginx
docker pull $host/$backup
# Остановка контенеров
docker-compose down
# Запуск контейнеров
docker-compose --file docker-compose-local.yml up -d
# Восстановление базы данных
docker exec zabbix-backup bash restoredb.sh
