if [ -z "$(ls -A /etc/cron.hourly)" ]; then
    echo $(date) >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1; 
    echo "/etc/cron.hourly/ пуста" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
else
    for file in /etc/cron.hourly/*
    do 
        echo "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1 
        echo $(date) >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
        bash "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1
    done 
fi
