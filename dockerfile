FROM mysql:8.0

RUN apt update && \
    apt upgrade -y && \
    apt install \
        cron \
        tzdata \
        -y && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    apt clean 

COPY entrypoint.sh /
COPY scheduler /

RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
