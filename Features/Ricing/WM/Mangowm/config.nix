{config, inputs, ...}:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./configs/binds.nix
    ./configs/window-effects.nix
    ./configs/animations.nix
    ./configs/input.nix
    ./rules/window.nix
    ./rules/layer.nix
  ];

  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      noctalia-shell &
      spotify &
      discord &
      altus &
      kdeconnect-indicator &
    '';
    
    extraConfig = ''
      source = ./noctalia.conf
    '';
  };
}