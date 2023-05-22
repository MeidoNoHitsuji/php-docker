# Defined in - @ line 1
function dphp --wraps='docker exec -it php fish' --description 'alias php docker exec -it php fish'
  docker exec -it -w=/var/(string replace $HOME/php-docker/ '' -- (pwd)) php fish $argv;
end