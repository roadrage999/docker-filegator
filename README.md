# docker-filegator

Implementation of Filegator on debian dockerized.

Pull the files, build with "docker build -t filegator:v007 ."

Some finesse is required for more fine grain control before getting into a full launch scenario

1 - run the container with a bind or volume mount to /temp or whatever you want to give a dir name on the container to be.

2 - docker exec -it "yourcontainername" /bin/bash

3 - copy the /etc/apache2 folder and /var/www directories to the folder above e.g. /temp

4 - exit the shell, stop the container

5 - map the volume or bind to the /etc/apache2 and /var/www respectively and run the container e.g. docker run -v yourvolume:/etc/apache2 -v yourvolume:/var/www

6 - start the container and if you get a permissions error be sure to check the masks and chmod where necessary, restart container again to confirm everything is working

7 - filegator and apache2 files can now be reconfigured to your desire and will save all settings persistently through container restarts


