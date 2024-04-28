{ pkgs }:

pkgs.writeShellScriptBin "gitcl" ''
  #!${pkgs.bash}/bin/bash

  repo_link=$1
  cd /home/$(whoami)/Codes/
  git clone $repo_link
  cd  "$(\ls -1dt ./*/ | head -n 1)"

  code .
''
