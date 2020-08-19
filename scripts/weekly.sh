if [ -z "$(ls -A /etc/cron.weekly)" ]; then
    echo $(date)
    echo "/etc/cron.weekly/ пуста"
else
    for file in /etc/cron.weekly/*
    do 
        echo "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1
        echo $(date) >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
        bash "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1
    done
fi
