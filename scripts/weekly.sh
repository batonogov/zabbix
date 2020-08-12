# Цикл перебирает все файлы в папке и выплняет их.
for file in /etc/cron.weekly/*
do 
    echo "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1
    echo $(date) >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
    bash "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1
done
