# Zabbix

Запуск Zabbix 5.0 сервера с поддержкой MySQL 8.0 базы данных, Zabbix веб-интерфейсом на основе Nginx веб-сервера и Zabbix Java gateway. 

**Запуск:**
```
docker-compose up -d
```

При запуске создаются папки: cron.daily, cron.hourly, cron.monthly cron.weekly, backup, mibs и alertscripts.  
В дополнении будет создан контейнер zabbix-backup, который обрабатывает задачи cron из папок.
