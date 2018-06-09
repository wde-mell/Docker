####	Commands for Docker Launcher     ###

####	docker build -t myunbuutudevs .  ###
#### 	docker run -it myunbuutudevs 	 ###

FROM ubuntu:rolling
LABEL maintainer="wde-mell@student.42.fr"

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y --no-install-recommends vim build-essential git vagrant zsh curl sudo
RUN sudo apt-get install valgrind -y
RUN apt-get install net-tools -y && apt-get install network-manager -y
RUN mkdir -p /root

WORKDIR /root

CMD ["zsh"]
