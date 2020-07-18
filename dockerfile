FROM mysql:8.0

RUN apt update && \
    apt upgrade -y && \
    apt install \
        cron \
        -y && \
    apt clean 

COPY entrypoint.sh /
COPY cron /tmp

RUN chmod +x /entrypoint.sh && \
    crontab /tmp/cron

ENTRYPOINT /entrypoint.sh
