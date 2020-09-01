FROM batonogov/cron:1.1

RUN apt update && \
    apt upgrade -y && \
    apt install \
        mariadb-server \
        cifs-utils \
        -y && \
    apt clean

COPY scripts/restoredb.sh /
