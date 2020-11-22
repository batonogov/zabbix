# Присваивание названий образов переменным
db=mariadb:10
gateway=zabbix-java-gateway
server=zabbix-server-mysql
nginx=zabbix-web-nginx-mysql

# Присваивание параметров переменным
registryserver=localhost
registryport=32777
host=$registryserver:$registryport

# Установка Local registry
docker run -d -p $registryport:5000 --restart always --name registry registry:2

docker pull $db
docker tag $db $host/$db
docker push $host/$db 

docker pull zabbix/$gateway
docker tag zabbix/$gateway $host/$gateway
docker push $host/$gateway

docker pull zabbix/$server
docker tag zabbix/$server $host/$server
docker push $host/$server

docker pull zabbix/$nginx
docker tag zabbix/$nginx $host/$nginx
docker push $host/$nginx

docker pull batonogov/cron
docker build -t $host/cron .
docker push $host/cron

docker pull registry:2
docker tag registry:2 $host/registry:2
docker push $host/registry:2

docker pull grafana/grafana
docker tag grafana/grafana $host/grafana
docker push $host/grafana
