#### docker build -t mylampserver . ####

####  docker run --rm -p 8080:80 -p 3306:3306 -e LOG_STDOUT=true -e LOG_STDERR=true -e LOG_LEVEL=debug -v $HOME/http:/var/www/html --name lamp fauria/lamp  ###

#### Get inside a running container and open a MariaDB console:

##	docker exec -i -t my-lamp-container bash ##
##   mysql -u root    ##

##		CREATE USER 'root2'@'%' IDENTIFIED BY 'root'; 	###
##		GRANT ALL PRIVILEGES ON * . * TO 'root2'@'%'; 	###
##		create database rush00;   								###

##  Check: show databases;
## 	use mysql;
##  select Host, User,Password from user;

FROM centos:latest

ENV container docker

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# normal updates
RUN yum -y update

# php && httpd
RUN yum -y install php70w php70w-opcache php70w-cli php70w-common php70w-gd php70w-intl php70w-mbstring php70w-mcrypt php70w-mysql php70w-mssql php70w-pdo php70w-pear php70w-soap php70w-xml php70w-xmlrpc httpd

# tools
RUN yum -y install epel-release iproute at curl crontabs git

# pagespeed
RUN curl -O https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_x86_64.rpm \
 && rpm -U mod-pagespeed-*.rpm \
 && yum clean all \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=bin --filename=composer \
 && php -r "unlink('composer-setup.php');" \
 && rm -rf /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# we want some config changes
COPY config/php_settings.ini /etc/php.d/
COPY config/v-host.conf /etc/httpd/conf.d/

# create webserver-default directory
RUN mkdir -p /var/www/page/public

EXPOSE 80

RUN systemctl enable httpd \
 && systemctl enable crond

CMD ["/usr/sbin/init"]
