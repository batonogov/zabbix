# Присваивание названий образов переменным
db=mariadb:10
gateway=zabbix-java-gateway:alpine-5.0-latest
server=zabbix-server-mysql:alpine-5.0-latest
nginx=zabbix-web-nginx-mysql:alpine-5.0-latest
backup=zabbix-backup

# Присваивание параметров переменным
registryport=5000
host=localhost:$registryport

# Установка Local registry
# docker run -d -p $registryport:5000 --restart always --name registry registry:2

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

# docker build .
docker build -t batonogov/$backup .
# docker push $host/$backup
