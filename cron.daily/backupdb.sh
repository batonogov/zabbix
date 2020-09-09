date=$(date +%Y-%m-%d)

mkdir /backup/$date
cd /backup/$date

echo Делаю резервное копирование базы данных
until mysqldump --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} > /backup/$date/zabbix.sql
do
    date
    sleep 60
done

echo Архивирую все это добро

tar -cjvf /backup/zabbix-mysql-$date.tar.bzip2 .
rm -rf /backup/$date

# Удалений файлов старше 7 дней
cd /backup
find . -type f -mtime +7 -exec rm {} \; 

echo Я сделяль
