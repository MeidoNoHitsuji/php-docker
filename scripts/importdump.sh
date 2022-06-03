#/bin/bash

docker exec --user=root -it mysql sh -c "mysql -uroot -p $1 < /dumps/$2.sql"