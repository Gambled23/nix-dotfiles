{inputs, pkgs, ...}:
{
  imports = [
    ./binds.nix
    ./layout.nix
    ./spawns.nix
  ];
}