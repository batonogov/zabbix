echo $(date)

filename=zabbix.sql
cd /backup && gunzip -c `ls -t | head -1` > $filename

until mysql --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < $filename
do
    sleep 10
done

rm $filename
