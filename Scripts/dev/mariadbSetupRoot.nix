{ pkgs }:

pkgs.writeShellScriptBin "dev_mariadbSetupRoot" ''
  #!${pkgs.bash}/bin/bash
  sudo mariadb -e 'CREATE USER "root"@"localhost" IDENTIFIED BY ""'
  sudo mariadb -e 'GRANT ALL PRIVILEGES ON * . * TO "root"@"localhost" IDENTIFIED BY ""'
  mariadb -u root
''


