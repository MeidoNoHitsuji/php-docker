#/bin/bash

currentDate=`date +"%Y-%m-%d"`
docker exec --user=root -it mysql sh -c "mysqldump -uroot -p $1 > /dumps/$1.$currentDate.sql"
filepath="$HOME/php-docker/db/dumps/$1.$currentDate.sql"
sudo chown meido:meido $filepath