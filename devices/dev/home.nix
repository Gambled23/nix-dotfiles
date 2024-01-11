{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home.nix
  ];
  
  home.packages = with pkgs; [ 
    # dev
    php83Packages.composer
    php83
    nodejs_21
  ];
}


