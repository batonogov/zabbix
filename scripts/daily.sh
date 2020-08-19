if [ -z "$(ls -A /etc/cron.daily)" ]; then
    echo $(date)
    echo "/etc/cron.daily/ пуста"
else
    for file in /etc/cron.daily/*
    do 
        echo "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1; 
        echo $(date) >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
        bash "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
    done
fi
