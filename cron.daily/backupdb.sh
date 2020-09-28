date=$(date +%Y-%m-%d)

echo Делаю резервное копирование базы данных
until mysqldump --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip > /backup/zabbix-mysql-$date.sql.gz
do
    date
    sleep 60
done

# Удалений файлов старше 7 дней
cd /backup
find . -type f -mtime +7 -exec rm {} \; 

echo Я сделяль
