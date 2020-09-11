db=mariadb:10
gateway=zabbix-java-gateway:alpine-5.0-latest
server=zabbix-server-mysql:alpine-5.0-latest
nginx=zabbix-web-nginx-mysql:alpine-5.0-latest
backup=zabbix-backup

docker pull $db
docker tag $db localhost:5000/$db
docker push localhost:5000/$db 

docker pull zabbix/$gateway
docker tag zabbix/$gateway localhost:5000/$gateway
docker push localhost:5000/$gateway

docker pull zabbix/$server
docker tag zabbix/$server localhost:5000/$server
docker push localhost:5000/$server

docker pull zabbix/$nginx
docker tag zabbix/$nginx localhost:5000/$nginx
docker push localhost:5000/$nginx

docker build -t batonogov/$backup .
docker tag batonogov/$backup localhost:5000/$backup
docker push localhost:5000/$backup
