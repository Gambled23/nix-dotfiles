{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home.nix

    ../../core/services/xserver/i3/i3.nix
  ];
  
  home.packages = with pkgs; [ 
    # dev
    php83Packages.composer
    php83
    nodejs_21
  ];
}


