# Цикл перебирает все файлы в папке и выплняет их.
for file in /etc/cron.hourly/*
do 
    echo "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1 
    echo $(date) >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
    bash "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1
done 
