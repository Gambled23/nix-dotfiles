{ pkgs }:

pkgs.writeShellScriptBin "dev_enviroment" ''
  #!${pkgs.bash}/bin/bash
  set -e

  if [ $2 ]; then
    path = $2
  else
    path = '.'
  fi
  
  cp -r /etc/nixos/dev-templates/{$1}/. {$path}
  direnv allow
''


