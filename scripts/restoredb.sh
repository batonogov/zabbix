echo $(date)

# Програсс бар
echo Восстановление базы данных
echo -ne '☭☭☭☭☭                   (33%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭           (66%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭ (100%)\r'
echo -ne '\n'

# Поиск свежей резервной копии
cd /backup
file=`ls -t | head -1`

# Восстановление базы данных
until gunzip -c $file | mysql --host=${DB_SERVER_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE}
do
    sleep 10
done

echo Готово
