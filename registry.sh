# Сохранить локально образ registry:2 в файл registry.tar
# docker save registry:2 -o registry.tar
# Загрузить образ registry:2 из файла 
# docker load -i registry.tar 
# Запуск локального регистра образов docker
docker run -d -p 5000:5000 --restart always --name registry registry:2
