for file in /etc/cron.hourly/*.sh
do  
    if [[ "$file" = "/etc/cron.hourly/*.sh" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1; 
        bash "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done

for file in /etc/cron.hourly/*.py
do 
    if [[ "$file" = "/etc/cron.hourly/*.py" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1; 
        python3 "$file" >> /var/log/cron/hourly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done
