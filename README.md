# Zabbix

Стабильная версия **Zabbix** с поддержкой базы данных **MariaDB**, Zabbix веб-интерфейсом на основе веб-сервера **Nginx** и **Zabbix Java gateway**. 

Создано на основе официального репозитория [Zabbix-Docker](https://github.com/zabbix/zabbix-docker) и [batonogov/cron](https://github.com/batonogov/cron).

Сервисный контейнер **zabbix-backup** умеет делать дамп и восстанорвление базы данных, а также внутри него работает планировщик задач cron для автоматизации работы.

### Запуск:

1. Настройте переменные в файле **main.env**

2. Установка необходимых пакетов для работы **cron** в **dockerfile**

3. Запустите **Zabbix**

**Docker Hub**

```
docker-compose up --build -d
```

**Local Registry:**

Обновитье локальный регистр

```
update-registy.sh
```

Запустите Zabbix

```
docker-compose --file docker-compose-local.yml up -d
```

Веб-интерфейс доступен по адресу **localhost:32775** (Порт можно изменить в **docker-compose.yml**)

**Учетная запись Zabbix по умолчанию:**
```
Admin
zabbix
```

### Структура приложения:

- zabbix/alertscripts/ - скрипты оповещений
- zabbix/mibs/ - MIB файлами
- zabbix/ssh_keys/ - ssh ключи
- backup/ - дампы базы данных mysql-server
- cron/* - папки для задач планировщика
- cron/logs/ - папка с логами cron
- scripts/ - скрипты копируемые в образ zabbix-backup через dockerfile
- docker-compose.yml - docker-compose файл
- docker-compose-local.yml - docker-compose файл для развертывания из локального репозитория
- dockerfile - dockerfile для сборки образа zabbix-backup
- LICENSE.md - Лицензия
- main.env - обьязательные переменные передаваемые в систему
- update-registy.sh - скрипт обновления Local Registry 

### Обслуживание:

1. Принудительное восстановление базы данных из последнего доступного дампа в backup/
```
docker exec zabbix-backup bash restoredb.sh
```

2. Остановка контейнеров
```
docker-compose down
```

3. Принудительный дамп базы данных в backup/
```
docker exec zabbix-backup bash /etc/cron.daily/backupdb.sh
```

### Поведение после установки:

- cron/daily/backupdb.sh - ежедневно создает дамп базы данных и сохраняет архив с ним папку backup
- cron/daily/copy-backup.sh - ежедневно копирует резервные копии на CIFS/SMB шару
- cron/hourly/cleaner.py - каждый час удалает логи и бекапы созданные более 7 дней назад

Готовый образ **Zabbix-backup** - [Docker Hub](https://hub.docker.com/repository/docker/batonogov/zabbix-backup). Образ **batonogov/cron** - [Docker Hub](https://hub.docker.com/repository/docker/batonogov/cron).
