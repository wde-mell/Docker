FROM debian

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install bzip2 -y

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011
EXPOSE 41144

RUN useradd potatoe

WORKDIR /home/teamspeak

RUN curl http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2 -o teamspeak.tar.bz2
RUN tar -xjf teamspeak.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

COPY ts3server.ini /home/teamspeak/teamspeak3-server_linux_amd64/ts3server.ini
USER potatoe

ENTRYPOINT ["sh", "ts3server_minimal_runscript.sh", "inifile=ts3server.ini"]

# https://ssamjh.nz/teamspeak3-ubuntudebian-installation-guide/
# https://docs.docker.com/engine/reference/builder/#environment-replacement

# Ports : https://docs.docker.com/samples/library/teamspeak/

# Than create a user for the exercise : 
# https://doc.ubuntu-fr.org/useradd

# workdir : cat server_quickstart.txt

# The USER instruction sets the user name.

# docker run -it --rm -p=9987:9987/udp -p=10011:10011 -p=30033:30033 ex01
# for check : docker build -t ex01 .