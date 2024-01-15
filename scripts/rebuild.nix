{ pkgs }:

pkgs.writeShellScriptBin "rebuild" ''
  #!${pkgs.bash}/bin/bash
  sudo nixos-rebuild switch
''


