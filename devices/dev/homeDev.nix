{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  imports = [
    ../../home.nix
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
  };
  
  home.packages = with pkgs; [ 
    # dev languages
  ];
}


