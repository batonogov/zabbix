# Zabbix

Сервер Zabbix 5.0 с поддержкой базы данных MySQL 8.0, Zabbix веб-интерфейсом на основе веб-сервера Nginx и Zabbix Java gateway. 

Создано на основе официального репозитория [Zabbix-Docker](https://github.com/zabbix/zabbix-docker).

К официальным контейнерам добавлен "Сервисный" контейнер zabbix-backup, который умеет делать дамп и восстанорвление базы данных, а также внутри него работает планировщик задач cron для автоматизации работы.

**Запуск:**

1. Настройте переменные в файле main.env

```
DB_SERVER_HOST=mysql-server
MYSQL_DATABASE=zabbix
MYSQL_USER=zabbix
MYSQL_PASSWORD=zabbix_pwd
MYSQL_ROOT_PASSWORD=root_pwd
ZBX_JAVAGATEWAY=zabbix-java-gateway
PHP_TZ=Europe/Moscow
ZBX_SERVER_NAME=Zabbix Docker
```

2. Установка необходимых пакетов в dockerfile
```
apt install \
    cron \
    tzdata \
    locales \
    cifs-utils \
    -y && \
```

3. Запуск
```
bash up.sh или up.bat (Для Windows)
```
Веб интерфес появится по адресу localhost:32775 (Порт можно изменить в docker-compose.yml)

**Учетная запись Zabbix по умолчанию:**
```
Admin
zabbix
```

**Структура приложения:**

- alertscripts - скрипты оповещений
- backup - дампы базы данных mysql-server
- cron.daily - ежедневные задачи для планировщика
- cron.hourly - ежечасные задачами для планировщика
- cron.logs - папка с логами cron
- cron.monthly - ежемесячные задачи для планировщика
- cron.weekly - еженедельные задачи для планировщика
- logs - прочие логи
- mibs - MIB файлами
- scripts - скрипты копируемые в образ zabbix-backup через dockerfile
- ssh_keys - ssh ключи
- backup.bat - принудительное резервное копирование базы данных в папку backup (Для Windows)
- backup.sh - принудительное резервное копирование базы данных в папку backup 
- docker-compose.yml - docker-compose файл
- dockerfile - dockerfile для сборки образа zabbix-backup
- entrypoint.sh - скрипт для работы планировщика в образе zabbix-backup
- main.env - переменные передаваемые в систему
- README.md - описание системы
- restore.bat - принудимтельное восстановление базы данных из последжнй доступной резервной копии и папке backup (Для Windows)
- restore.sh - принудимтельное восстановление базы данных из последжнй доступной резервной копии и папке backup
- scheduler - расписание планировщика для zabbix-backup
- up.bat - скрипт запуска (Для Windows)
- up.sh - скрипт запуска
- update.bat - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа (Для Windows)
- update.sh - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа

**Поведение после установки:**

- cron.daily/backupdb.sh - ежедневно создает дамп базы данных и сожраняет архив с ним папку backup, он будет храниться до 7 дней.
- cron.daily/cleaner.sh - ежедневно удаляет старые файлы.
- cron.daily/copy-backup.sh - ежедневно копирует резерные копии на CIFS/SMB шару.

Готовый образ Zabbix-backup досутпен на [Docker Hub](https://hub.docker.com/repository/docker/batonogov/zabbix-backup).
