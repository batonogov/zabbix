# Zabbix

Сервер Zabbix 5.0 с поддержкой базы данных MariaDB 10, Zabbix веб-интерфейсом на основе веб-сервера Nginx и Zabbix Java gateway. 

Создано на основе официального репозитория [Zabbix-Docker](https://github.com/zabbix/zabbix-docker) и [batonogov/cron](https://github.com/batonogov/cron).

Сервисный контейнер zabbix-backup умеет делать дамп и восстанорвление базы данных, а также внутри него работает планировщик задач cron для автоматизации работы.

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

2. Установка необходимых пакетов для работы cron в dockerfile
```
apt install \
    mariadb-server \
    cifs-utils \
    -y && \
```

3. Запуск
```
docker-compose up --build -d
```
Веб-интерфейс доступен по адресу localhost:32775 (Порт можно изменить в docker-compose.yml)

**Учетная запись Zabbix по умолчанию:**
```
Admin
zabbix
```

**Структура приложения:**

- alertscripts/ - скрипты оповещений
- backup/ - дампы базы данных mysql-server
- cron.daily/ - ежедневные задачи для планировщика
- cron.hourly/ - ежечасные задачами для планировщика
- cron.logs/ - папка с логами cron
- cron.monthly/ - ежемесячные задачи для планировщика
- cron.reboot/ - задачи, которые планировщик выполняет после перезагрузки
- cron.weekly/ - еженедельные задачи для планировщика
- mibs/ - MIB файлами
- scripts/ - скрипты копируемые в образ zabbix-backup через dockerfile
- ssh_keys/ - ssh ключи
- backup.bat - принудительное резервное копирование базы данных в папку backup (Для Windows)
- backup.sh - принудительное резервное копирование базы данных в папку backup 
- docker-compose.yml - docker-compose файл
- dockerfile - dockerfile для сборки образа zabbix-backup
- main.env - переменные передаваемые в систему
- README.md - описание системы
- update.bat - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа (Для Windows)
- update.sh - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа

**Обслуживание:**

1. Принудительное восстановление базы данных из последней доступной резервной копии и папке backup
```
docker exec zabbix-backup bash restoredb.sh
```

2. Остановка контенеров
```
docker-compose down
```

**Поведение после установки:**

- cron.daily/backupdb.sh - ежедневно создает дамп базы данных и сожраняет архив с ним папку backup, он будет храниться до 7 дней.
- cron.daily/cleaner.sh - ежедневно удаляет старые файлы.
- cron.daily/copy-backup.sh - ежедневно копирует резерные копии на CIFS/SMB шару.

Готовый образ Zabbix-backup - [Docker Hub](https://hub.docker.com/repository/docker/batonogov/zabbix-backup). Образ batonogov/cron - [Docker Hub](https://hub.docker.com/repository/docker/batonogov/cron).
