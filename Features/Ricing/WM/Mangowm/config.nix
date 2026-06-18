{inputs, osConfig, ...}:
let 
  hostconfig = if osConfig.networking.hostName == "pc-gambled" then ./hosts/pc-gambled.nix else ./hosts/dev-gambled.nix;
in 
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./configs/binds.nix
    ./configs/window-effects.nix
    ./configs/animations.nix
    ./configs/input.nix
    ./rules/window.nix
    ./rules/layer.nix
    hostconfig
  ];

  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      noctalia-shell &
      spotify &
      discord &
      altus &
      kdeconnect-indicator &
      wl-clip-persist --clipboard regular --reconnect-tries 0 &
      wl-paste --type text --watch cliphist store &
    '';
    
    extraConfig = ''
      source = ./noctalia.conf
    '';
  };
}