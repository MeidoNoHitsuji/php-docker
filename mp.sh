#!/bin/bash

regexp="^(https|git@).*\/([a-z-]*)\.git$"

if [ -n "$1" ]
then
[[ $1 =~ $regexp ]]
reponame=${BASH_REMATCH[2]}
fi

if [ -z "$reponame" ]
then
echo "Invalid git repository url"
exit
fi

cd ./www
git clone $1

if [ -n "$2" ]
then
projectname=$2
mv ./$reponame ./$projectname
else
projectname=$reponame
fi

cd ../hosts
touch $projectname.local.conf
echo 'server {
    listen *:80;
    server_name '$projectname'.local;
    
    root /var/www/'$projectname'/public/;

    location / {
        try_files $uri /index.php$is_args$args;
    }

    location ~ ^/index\.php(/|$) {
        fastcgi_pass php:9000;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
        internal;
    }

    location ~ \.php$ {
        return 404;
    }

    error_log /var/log/nginx/'$projectname'_error.log;
    access_log /var/log/nginx/'$projectname'_access.log;
}' > ./$projectname.local.conf

cd ../
docker-compose up -d
docker exec -i -t php-dev-env_nginx_1 nginx -s reload
echo " "
echo 'To add domain to hosts file you must use root privileges:'
sudo -i << EOF
echo '
127.0.0.1 '$projectname'.local' >> /etc/hosts
EOF

echo " "
echo 'To access the project enter '$projectname'.local in browser.'
echo 'Now you must go to create DB and configure project environment.'
exit