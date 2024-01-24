{ pkgs }:

pkgs.writeShellScriptBin "mysqlSetupRoot" ''
  #!${pkgs.bash}/bin/bash
  sudo mysql -e 'CREATE USER "root"@"localhost" IDENTIFIED BY ""'
  sudo mysql -e 'GRANT ALL PRIVILEGES ON * . * TO "root"@"localhost" IDENTIFIED BY ""'
  mysql -u root
''


