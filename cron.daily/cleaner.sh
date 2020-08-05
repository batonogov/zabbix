echo $(date)
echo Начинаю чистку

# Удаление файлов старше 7 дней в папке backup
find /backup -type f -mtime +7 -exec rm {} \; 

# Удаление файлов старше 7 дней в папке /var/log/cron
find /var/log/cron -type f -mtime +7 -exec rm {} \; 

# Удаление файлов старше 7 дней в папке /var/log/etc
find /var/log/etc -type f -mtime +7 -exec rm {} \; 

# Удаление файлов старше 7 дней на SMB/CIFS шаре
mkdir /temp

until mount -t cifs $cifs_share /temp -o user=$login,password=$password
do
    sleep 60
    echo Пробую снова
done

find /temp -type f -mtime +7 -exec rm {} \; 

umount /temp
rmdir /temp

echo Чистка завершена
