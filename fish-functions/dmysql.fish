# Defined in - @ line 1
function dmysql --wraps='docker exec -it --user=root mysql bash' --description 'alias dmysql docker exec -it --user=root mysql bash'
  docker exec -it --user=root mysql bash $argv;
end