{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash

  nh clean all

  # sudo rm /home/gambled/Pictures/Screenshots/*
  sudo rm -rf /home/gambled/.cache/

  ${pkgs.gum}/bin/gum style --align center --width 50 --margin "1" --padding "1" "Sistema limpiado"
''
