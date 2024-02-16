{ pkgs }:

pkgs.writeShellScriptBin "dev_sigi" ''
  #!${pkgs.bash}/bin/bash
  kitty --session /etc/nixos/core/programs/kitty/sigi.conf
''


