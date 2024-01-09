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

  ];
}


