date=$(date +%Y-%m-%d)

echo Делаю резервное копирование базы данных
echo -ne '☭☭☭☭☭                   (33%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭           (66%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭ (100%)\r'
echo -ne '\n'

until mysqldump --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip > /backup/zabbix-mysql-$date.sql.gz
do
    date
    sleep 60
done

echo Я сделяль
