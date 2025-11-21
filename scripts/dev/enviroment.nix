{ pkgs }:

pkgs.writeShellScriptBin "dev_enviroment" ''
  #!${pkgs.bash}/bin/bash
  set -e

  if [ ! $1 ]; then
    echo "You must provide a template name!"
    echo "Valid template names are:"
    echp "cpp"
    echp "laravel"
    echp "nodejs"
    echp "prolog"
    echp "python"
    echp "reflex"
    echp "rust"
    exit 1
  fi

  if [ $2 ]; then
    cd $2
  fi

  cp -r /etc/nixos/dev-templates/$1/. .
  direnv allow
''