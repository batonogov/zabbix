for file in /etc/cron.weekly/*.sh
do  
    if [[ "$file" = "/etc/cron.weekly/*.sh" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1; 
        bash "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done

for file in /etc/cron.weekly/*.py
do 
    if [[ "$file" = "/etc/cron.weekly/*.py" ]]
    then
        echo "$file"
    else
        echo $(date) >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
        echo "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1; 
        python3 "$file" >> /var/log/cron/weekly-$(date +"%Y-%m-%d").log 2>&1;
    fi
done
