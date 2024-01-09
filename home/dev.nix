{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home.nix
  ];
  home = {
    username = "gambled";
    homeDirectory = "/home/gambled";
  };
  
  home.packages = with pkgs; [ 
    # dev
    php83Packages.composer
    php83
    nodejs_21

    # sigi (nix store 23.05)
    nodejs_16
    php82Packages.composer
    yarn
  ];
}


