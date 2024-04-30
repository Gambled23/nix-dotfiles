{ pkgs }:

pkgs.writeShellScriptBin "dev_enviroment" ''
  #!${pkgs.bash}/bin/bash
  set -e

  if [ ! $1 ]; then
    echo "You must provide a template name"
    exit 1
  fi

  if [ $2 ]; then
    project_path=$2
  else
    project_path='.'
  fi

  cp -r /etc/nixos/dev-templates/$1/. $project_path
  direnv allow
''