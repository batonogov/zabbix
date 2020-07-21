#!/bin/bash

echo $(date) >> /var/log/etc/zabbix-backup-$(date +"%Y-%m-%d").log 2>&1
echo "Контейнер zabbix-backup бал запущен" >> /var/log/etc/zabbix-backup-$(date +"%Y-%m-%d").log 2>&1

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

crontab scheduler
cron -f 
