#/bin/bash

export $(grep -v '^#' ~/php-docker/.env | xargs -d '\n')

docker exec --user=root -it mysql sh -c "mysql -uroot -p$MYSQL_ROOT_PASSWORD $2 < /dumps/$1.sql"