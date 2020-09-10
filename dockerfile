FROM batonogov/cron

LABEL maintainer="batonogov@icloud.com"

RUN apt update && \
    apt install \
        mariadb-server \
        cifs-utils \
        -y

COPY scripts/restoredb.sh /usr/local/cron/
