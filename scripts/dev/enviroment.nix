{ pkgs }:

pkgs.writeShellScriptBin "dev_enviroment" ''
  #!${pkgs.bash}/bin/bash
  cp -r /etc/nixos/dev-templates/{$1}/. .
  direnv allow
''


