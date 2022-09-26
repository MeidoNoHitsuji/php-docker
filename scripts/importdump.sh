#/bin/bash

export $(grep -v '^#' ~/php-docker/.env | xargs -d '\n')

scp root@79.143.25.54:/root/backups/db/$1.sql.gz ~/php-docker/db/dumps/$1.sql.gz
gzip -d ~/php-docker/db/dumps/$1.sql.gz

docker exec --user=root -it mysql sh -c "mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /dumps/$1.sql"