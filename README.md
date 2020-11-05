# docker-filegator

Implementation of Filegator on debian dockerized.

Pull the files, build with "docker build -t filegator:v007 ."

Some finesse is required for more fine grain control before getting into a full launch scenario

1 - run the container with a bind or volume mount to /temp or whatever you want to give a dir name on the container to be.

2 - docker exec -it "yourcontainername" /bain/bash

3 - copy the /etc/apache2 folder and /var/www directories to the folder above e.g. /temp

4 - exit the shell, stop the container

5 - map the volume or bind to the /etc/apache2 and /var/www respectively and run the container

6 - filegator and apache2 files can now be reconfigured to your desire and will save all settings persistently through container restarts

7 - launch and have fun with full FileGator ready to rumble, if you get a permissions error be sure to check the masks and chmod where necessary
