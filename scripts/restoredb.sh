echo $(date)

echo Восстановление базы данных

sleep 10

until cd /backup && gunzip -c `ls -t | head -1` | mysql --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE}
do
    sleep 10
done
