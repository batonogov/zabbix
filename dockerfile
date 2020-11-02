FROM batonogov/cron

LABEL maintainer="batonogov@icloud.com"

# При необходимости установите необходимые пакеты в контенер zabbix-backup
RUN apt update && \
    apt install \
        mariadb-server \
        cifs-utils \
        -y

COPY scripts/restoredb.sh /usr/local/cron/
