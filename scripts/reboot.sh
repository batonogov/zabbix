for file in /etc/cron.reboot/*.sh
do  
    if [[ "$file" = "/etc/cron.reboot/*.sh" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1; 
        bash "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
    fi
done

for file in /etc/cron.reboot/*.py
do 
    if [[ "$file" = "/etc/cron.reboot/*.py" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1; 
        python3 "$file" >> /var/log/cron/reboot-$(date +"%Y-%m-%d").log 2>&1;
    fi
done
