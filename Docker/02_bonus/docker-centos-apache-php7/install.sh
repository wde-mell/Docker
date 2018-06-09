#!/bin/sh

#mkdir $HOME/goinfre/.docker
#ln -s $HOME/goinfre/.docker $HOME/.docker
#docker-machine --storage-path "/goinfre" create --driver virtualbox --virtualbox-memory 2000 Char
#eval "$(docker-machine --storage-path "/goinfre" env char)"

## docker run -d --restart on-failure -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=rush00 --name stock mysql
## docker run -p 8100:80 --link stock:mysql -v $HOME/http/MyWebSite:/var/www/html --name lamp fauria/lamp


docker build -t mylampserver .
docker run --rm -p 8080:80 -p 3306:3306 -e LOG_STDOUT=true -e LOG_STDERR=true -e LOG_LEVEL=debug -v $HOME/http:/var/www/html --name lamp fauria/lamp
docker exec -i -t lamp bash < mysql < "CREATE USER 'root2'@'localhost' IDENTIFIED BY 'root';"
mysql < "GRANT ALL PRIVILEGES ON * . * TO 'root2'@'localhost';"
mysql < "create database rush00;"


