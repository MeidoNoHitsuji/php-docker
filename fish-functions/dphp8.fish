# Defined in - @ line 1
function dphp8 --wraps='docker exec -it php8 fish' --description 'alias php8 docker exec -it php8 fish'
  docker exec -it -w=/var/(string replace $HOME/php-docker/ '' -- (pwd)) php8 fish $argv;
end