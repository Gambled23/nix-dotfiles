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
  ];
}


