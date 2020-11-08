# Весия Zabbix (5.0 или 5.2)
version=5.2

echo Zabbix $version

# Присваивание названий образов переменным
db=mariadb:10
gateway=zabbix-java-gateway:alpine-$version-latest
server=zabbix-server-mysql:alpine-$version-latest
nginx=zabbix-web-nginx-mysql:alpine-$version-latest
backup=zabbix-backup

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

docker build -t $host/$backup .
docker push $host/$backup

docker pull registry:2
docker tag registry:2 $host/registry:2
docker push $host/registry:2

docker pull grafana/grafana:7.3.1
docker tag grafana/grafana $host/grafana
docker push $host/grafana:7.3.1
