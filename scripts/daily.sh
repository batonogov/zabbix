for file in /etc/cron.daily/*.sh
do  
    if [[ "$file" = "/etc/cron.daily/*.sh" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1; 
        bash "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
    fi
done

for file in /etc/cron.daily/*.py
do 
    if [[ "$file" = "/etc/cron.daily/*.py" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1; 
        python3 "$file" >> /var/log/cron/daily-$(date +"%Y-%m-%d").log 2>&1;
    fi
done
