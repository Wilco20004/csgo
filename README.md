# Description
Docker Image of CSGO Dedicated Server based on ubuntu.<br>Rcon password can be set by editing server.cfg file.<br><br>

Default rcon : toldrcon   

## Dedicated server is launched with the command
sudo docker run -p  27015:27015 -p 27015:27015/udp -it toldwin/csgo:062015
<br><br>
## You also can launch in command line mode with
sudo docker run -itp 27015:27015/udp toldwin/csgo bash

## To test all incoming connections with tcpdump
sudo apt-get install tcpdump<br>
sudo tcpdump -i eth0 port 27015
