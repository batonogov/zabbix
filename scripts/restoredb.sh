echo $(date)

echo Восстановление базы данных
echo -ne '☭☭☭☭☭                   (33%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭           (66%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭ (100%)\r'
echo -ne '\n'

cd /backup
file=`ls -t | head -1`

until gunzip -c $file | mysql --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE}
do
    sleep 10
done
