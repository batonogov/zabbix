FROM mysql:8.0

RUN apt update && \
    apt upgrade -y && \
    apt install \
        cron \
        tzdata \
        locales \
        -y && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && locale-gen \
    apt clean

COPY entrypoint.sh /
COPY scheduler /
COPY hourly.sh /
COPY daily.sh /
COPY weekly.sh /
COPY monthly.sh /
COPY restoredb.sh /

RUN chmod +x /entrypoint.sh

ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU:ru  
ENV LC_ALL ru_RU.UTF-8 

ENTRYPOINT /entrypoint.sh
