####	Commands for Docker Launcher     ###

#### docker build -t mymumble . ####

####  export  	SUPW=superuserpassword		####
####  export   	ROOMS=general,gaming,music  ####

#### docker run -p 64738:64738/tcp -p 64738:64738/udp -e ROOMS="general,gaming" -e SUPW=1337 -t jhaals/mumble-server   ####

FROM ubuntu

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor ruby-full mumble-server libsqlite3-dev build-essential

RUN gem install data_mapper --no-rdoc --no-ri
RUN gem install dm-sqlite-adapter --no-rdoc --no-ri

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /
ADD mumble.rb /
ADD mumble-server.ini /
RUN chmod +x /start.sh


EXPOSE 64738
CMD ["/start.sh"]
