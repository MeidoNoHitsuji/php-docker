Nginx+PHP+PostgreSQL/MySQL by using Docker-compose
=============================
В этом репозитории я попытался обобщить опыт других пользователей по созданию локальной среды WEB-разработки с использованием контейнеров docker.

УСТАНОВКА
------------
Просто клонируйте репозиторий или загрузите и распакуйте файлы в свой каталог. Вы должны увидеть следующие файлы и каталоги:

    hosts/               Nginx configuration files
    images/php/          Dockerfile and php.ini
    logs/                logs files
    db/data/             mount db configuration directory from container(*)
    db/initdb/           SQL DB initialization files
    www/                 your WEB-Application
    README.MD            this file
    docker-compose.yml   Docker-compose file

Клонируйте контент файла .env.example в .env, и заполните параметры `MYSQL_DATABASE` и `MYSQL_ROOT_PASSWORD`

По умолчанию в сборке будет подниматься только `nginx`, `php7.4`, `mysql` и `node`. Если вам нужно будет что-то ещё из списка `php8`, `php8-horizon`, `clickhouse`, `centrifugo`, `postgres`, `redis`, то раскомментируйте соответствующий сервис в `docker-compose.yml`

!!ОБЯЗАТЕЛЬНО ЗАМЕНИТЕ ВСЕ УПОМИНАНИЯ meido НА ИМЯ СВОЕГО ПОЛЬЗОВАТЕЛЯ В СИСТЕМЕ wsl/linux.!!

После этого можно запускать команду `docker-compose up -d`

ТРЕБОВАНИЯ
------------
[Docker](https://docs.docker.com/engine/install/) 

[Docker-compose](https://docs.docker.com/compose/install/)

СОЗДАНИЕ ПРОЕКТА
--------------

