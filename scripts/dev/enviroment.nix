{ pkgs }:

pkgs.writeShellScriptBin "dev_enviroment" ''
  #!${pkgs.bash}/bin/bash
  nix flake init --template github:gambled23/nix-dotfiles/dev-templates#python
''


