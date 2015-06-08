# Description
Docker Image of CSGO Dedicated Server based on ubuntu

# Dedicated server is launched with the command
sudo docker run -p  27015:27015 -p 27015:27015/udp -it toldwin/csgo:062015

# You also can launch command line with
sudo docker run -itp 27015:27015/udp toldwin/csgo bash

# And test and incoming connections with tcpdump
sudo apt-get install tcpdump
sudo tcpdump -i eth0 port 27015
