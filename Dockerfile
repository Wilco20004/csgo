FROM ubuntu 
MAINTAINER Willem <wilco@peachss.co.za> 

ENV REFRESH_DATE 2018-02-04

# lib32gcc1 installation 
RUN \ 
  apt-get update && \ 
  DEBIAN_FRONTEND=noninteractive && \ 
  apt-get -y install lib32gcc1 && \ 
  apt-get -y install wget 

# Steam installation 
RUN mkdir /steamcmd && \ 
    cd /steamcmd && \ 
        wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \ 
        tar -xvzf steamcmd_linux.tar.gz 

# CSGO dedicated server installation 
# RUN /steamcmd/steamcmd.sh +login anonymous +force_install_dir /steamcmd/csgoserver +app_update 740 validate +quit 

# Steam user creation and usage 
#RUN useradd -m steam --password password 
#RUN sudo chown -R steam: /steamcmd 
#user steam 

# Expose Dedicated server port 
EXPOSE 27015

        
# Used Dedicated server parameters 
ENV GAME_TYPE 0 
ENV GAME_MODE 1 
ENV MAP_GROUP mg_active 
ENV START_MAP de_dust2 
ENV API_KEY 
ENV SERVER_NAME 'Forsaken Server'
ENV RCON_PW 'Test123'

VOLUME ["/steamcmd"]

# Launching dedicated server 
WORKDIR /steamcmd/csgoserver 
CMD ./srcds_run \ 
  -game csgo \ 
  -console \ 
  -usercon \
  +game_type $GAME_TYPE \ 
  +game_mode $GAME_MODE \ 
  +mapgroup $MAP_GROUP \ 
  +map $START_MAP \ 
  +sv_setsteamaccount $API_KEY \ 
  +hostname $SERVER_NAME \ 
  +rcon_password $RCON_PW
