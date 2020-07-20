# Zabbix

Сервер Zabbix 5.0 с поддержкой базы данных MySQL 8.0, Zabbix веб-интерфейсом на основе Nginx веб-сервера и Zabbix Java gateway. 

**Запуск:**

1. Настройка переменных.

Настройте переменные в файле main.env
```
MYSQL_DATABASE=zabbix
MYSQL_USER=zabbix
MYSQL_PASSWORD=zabbix_pwd
MYSQL_ROOT_PASSWORD=root_pwd
PHP_TZ=Europe/Moscow
ZBX_SERVER_NAME=Zabbix Docker
```

2. Установка пакетов в dockerfile.
```
apt install \
    cron \
    tzdata \
    locales \
    **curl** \
    **bash** \
    -y && \
```

3. Запуск:
```
docker-compose up -d
```
