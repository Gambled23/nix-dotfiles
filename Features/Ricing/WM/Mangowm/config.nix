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
    ./rules/tags.nix
    hostconfig
  ];

  services.gnome-keyring = {
    enable = true;
    components = [ "pkcs11" "secrets" "ssh" ];
  };

  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      noctalia-shell &
      spotify &
      discord &
      altus &
      steam %U &
      kdeconnect-indicator &
      wl-clip-persist --clipboard regular --reconnect-tries 0 &
      wl-paste --type text --watch cliphist store &
    '';

    settings = {
      enable_floating_snap = 1;
      allow_tearing = 1;
      tag_carousel = 1;
    };

    systemd.xdgAutostart = true;
    
    extraConfig = ''
      source = ./noctalia.conf
    '';
  };
}
