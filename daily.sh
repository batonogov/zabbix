for file in /etc/cron.daily/*
do 
    echo "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1; 
    bash "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
done
