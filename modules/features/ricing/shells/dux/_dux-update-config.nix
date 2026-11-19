{ pkgs }:

pkgs.writeShellScriptBin "dux-update-config" ''
  #!${pkgs.bash}/bin/bash

  dms ipc call settings dump | nix run github:cloudandheat/json2nix > /etc/nixos/modules/features/ricing/shells/dux/_Settings.nix
''
