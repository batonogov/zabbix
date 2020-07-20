# Zabbix

Сервер Zabbix 5.0 с поддержкой базы данных MySQL 8.0, Zabbix веб-интерфейсом на основе Nginx веб-сервера и Zabbix Java gateway. 

**Запуск:**

1. Настройте переменные в файле main.env

```
MYSQL_DATABASE=zabbix
MYSQL_USER=zabbix
MYSQL_PASSWORD=zabbix_pwd
MYSQL_ROOT_PASSWORD=root_pwd
PHP_TZ=Europe/Moscow
ZBX_SERVER_NAME=Zabbix Docker
```

2. Установка необходимых пакетов в dockerfile
```
apt install \
    cron \
    tzdata \
    locales \
    `curl` \
    -y && \
```

3. Запуск
```
docker-compose up -d
```

**Структура приложения:**

- alertscripts - папка со скриптами оповещений
- backup - папка для дампов базы данных mysql-server
- cron.hourly, cron.daily, cron.weekly и cron.monthly - папки для задач планировщика
- cron.logs - папка с логами cron
- mibs - папка с MIBs файлами
