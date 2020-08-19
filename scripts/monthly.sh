if [ -z "$(ls -A /etc/cron.monthly)" ]; then
    echo $(date)
    echo "/etc/cron.monthly/ пуста"
else
    for file in /etc/cron.monthly/*
    do 
        echo "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1
        echo $(date) >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1;
        bash "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1
    done
fi
