#!/bin/bash

echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Настройка расписания планировщика
echo "SHELL=/bin/bash
BASH_ENV=/container.env
$CRON >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f 
