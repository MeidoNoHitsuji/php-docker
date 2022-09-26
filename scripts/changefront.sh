#!/bin/bash

finded=false

for var in $(ls ~/php-docker/frontends/)
do
    if [[ "$var" == "$1" ]] ; then
        finded=true
    fi
done

if [[ "$finded" == false ]]; then
    echo "Не нашёл папку с наименованием '$1' в папке ~/php-docker/frontends/"
    exit
fi

rm -f ~/php-docker/frontend
ln -s ~/php-docker/frontends/$1 ~/php-docker/frontend