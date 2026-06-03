{inputs, pkgs, ...}:
{
  imports = [
    ./binds.nix
    ./layout.nix
    ./rules.nix
    ./spawns.nix

    ../../../Tools/vicinae.nix
    ../../Shells/noctalia.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
  };

  # wayland.windowManager.niri.package = pkgs.niri-unstable;
}