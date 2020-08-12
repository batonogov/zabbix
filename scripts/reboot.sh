for file in /etc/cron.reboot/*
do 
    echo "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1; 
    echo $(date) >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
    bash "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
done
