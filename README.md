# Zabbix

Сервер Zabbix 5.0 с поддержкой базы данных MariaDB 10, Zabbix веб-интерфейсом на основе веб-сервера Nginx и Zabbix Java gateway. 

Создано на основе официального репозитория [Zabbix-Docker](https://github.com/zabbix/zabbix-docker) и [batonogov/cron](https://github.com/batonogov/cron).

Сервисный контейнер zabbix-backup умеет делать дамп и восстанорвление базы данных, а также внутри него работает планировщик задач cron для автоматизации работы.

**Запуск:**

1. Настройте переменные в файле main.env

2. Установка необходимых пакетов для работы cron в dockerfile

3. Запустите Zabbix
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
- cron*/ - папки для задач планировщика
- cron.logs/ - папка с логами cron
- mibs/ - MIB файлами
- scripts/ - скрипты копируемые в образ zabbix-backup через dockerfile
- ssh_keys/ - ssh ключи
- backup.bat - принудительное резервное копирование базы данных в папку backup (Для Windows)
- backup.sh - принудительное резервное копирование базы данных в папку backup 
- docker-compose.yml - docker-compose файл
- dockerfile - dockerfile для сборки образа zabbix-backup
- main.env - переменные передаваемые в систему
- update.bat - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа (Для Windows)
- update.sh - скрипт делает дамп базы данных, проверяет наличие свежих версий образов, перестанавливает zabbix и восстанавливает данные из дампа

**Обслуживание:**

1. Принудительное восстановление базы данных из последнего доступного дампа в backup/
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
