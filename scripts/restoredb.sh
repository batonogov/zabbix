echo $(date)

cd /backup
tar -xjf `ls -t | head -1`

until mysql --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < *.sql
do
    sleep 60
done

rm *.sql
