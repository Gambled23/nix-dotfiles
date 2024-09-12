{ pkgs }:

pkgs.writeShellScriptBin "modular-prod-backup" ''
  #!${pkgs.bash}/bin/bash

  USERNAME="root"
  PASSWORD=""   
  DATABASE="modular-prod"

  DATE=$(date +%Y_%m_%d)

  BACKUP_FILE="backup_$DATE.sql"

  mysqldump -u $USERNAME -p$PASSWORD $DATABASE > $BACKUP_FILE

  echo "Backup created: $BACKUP_FILE"
''


