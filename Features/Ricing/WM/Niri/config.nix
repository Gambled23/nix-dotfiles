{inputs, pkgs, ...}:
{
  imports = [
    ./binds.nix
    ./layout.nix
    ./rules.nix
    ./spawns.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
  };
}