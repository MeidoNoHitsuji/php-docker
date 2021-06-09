Nginx+PHP+PostgreSQL/MySQL+Adminer by using Docker-compose
=============================
In this repository I tryed to agregate experience of another users for build local WEB-development envirounment by using docker containers.

INSTALLATION
------------
Just clone repository or download and unpack the files in to your directory. You shall see the following files and directories:

    hosts/               Nginx configuration files
    images/php/          Dockerfile and php.ini
    logs/                logs files
    db/data/             mount db configuration directory from container(*)
    db/initdb/           SQL DB initialization files
    www/                 your WEB-Application
    README.MD            this file
    docker-compose.yml   Docker-compose file

You must define envirounment variables `DB_NAME`, `DB_USER`, `DB_PASSWORD` (and `DB_ROOT_PASSWORD` if use MySQL) and use the `docker-compose up` command to run containers.
    
`(*)Notice: the Docker specific variables will only have an effect if you start the container with a data directory that is empty. Any pre-existing database will be left untouched on container startup.`

REQUIREMENTS
------------
[Docker](https://docs.docker.com/engine/install/) 

[Docker-compose](https://docs.docker.com/compose/install/)

CREATE PROJECT
--------------
For the convenience of deploying projects, I made a simple console script `mp.sh`.

Usage
```
./mp.sh https://url.to.your/repository.git [projectname]
```
You can use SSH or HTTPS links to your git repository. Optional parameter project name is use for naming directory, .conf file and local domain name. If it is empty then the repository name is used.
