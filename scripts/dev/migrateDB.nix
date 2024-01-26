{ pkgs }:

pkgs.writeShellScriptBin "dev_owerlevel10kmigrateDB" ''
  #!${pkgs.bash}/bin/bash

  read -p "Ingresa el nombre de la DB: " db_name
  read -p "Ingresa la ruta del backup: " backup_route
  read -p "Ingresa el usuario de la DB: " db_user

  mysql -u $db_user -p $db_name < $backup_route
''


