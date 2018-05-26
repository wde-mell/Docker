FROM debian

# docker run -it --rm -p=9987:9987/udp -p=10011:10011 -p=30033:30033 ex01

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install bzip2 -y

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011
EXPOSE 41144

RUN useradd ts3
WORKDIR /home/teamspeak
RUN curl -O http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2
RUN tar xpfv teamspeak3-*.bz2
WORKDIR teamspeak3-server_linux_amd64
COPY ts3server.ini /home/teamspeak/teamspeak3-server_linux_amd64/ts3server.ini
USER ts3
ENTRYPOINT ["sh", "ts3server_minimal_runscript.sh", "inifile=ts3server.ini"]
