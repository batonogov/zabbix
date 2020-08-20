for file in /etc/cron.monthly/*.sh
do  
    if [[ "$file" = "/etc/cron.monthly/*.sh" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1; 
        bash "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done

for file in /etc/cron.monthly/*.py
do 
    if [[ "$file" = "/etc/cron.monthly/*.py" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1; 
        python3 "$file" >> /var/log/cron/monthly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done
