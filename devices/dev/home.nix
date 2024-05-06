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
    ../../core/programs/alacritty.nix
    ../../core/programs/direnv.nix
    ../../core/programs/git.nix
    ../../core/programs/kitty/kitty.nix
    ../../core/programs/lsd.nix
    ../../core/programs/neovim.nix
    ../../core/programs/starship.nix
    ../../core/programs/zsh.nix
    ../../core/programs/firefox.nix
  ];
  
  home.packages = with pkgs; [ 
    # dev languages
  ];
}


