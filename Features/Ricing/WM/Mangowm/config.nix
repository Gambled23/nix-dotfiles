{inputs, osConfig, ...}:
let 
  hostconfig = if osConfig.networking.hostName == "pc-gambled" then ./hosts/pc-gambled.nix else ./hosts/dev-gambled.nix;
in 
{
  imports = [
    inputs.mangowm.hmModules.mango

    hostconfig
    ./configs/binds.nix
    ./configs/window-effects.nix
    ./configs/animations.nix
    ./configs/input.nix
    ./rules/window.nix
    ./rules/layer.nix
    ./rules/tags.nix
  ];

  services.gnome-keyring = {
    enable = true;
    components = [ "pkcs11" "secrets" "ssh" ];
  };

  wayland.windowManager.mango = {
    enable = true;

    settings = {
      exec-once = [
        "noctalia"
        "discord"
        "kdeconnect-indicator"
        "wl-clip-persist --clipboard regular --reconnect-tries 0"
        "wl-paste --type text --watch cliphist store"
      ];
      enable_floating_snap = 1;
      snap_distance = 30;
      allow_tearing = 1;
      syncobj_enable = 1; #Enable drm_syncobj timeline support (helps with gaming stutter/lag). Requires restart.
      tag_carousel = 1;
      drag_tile_to_tile = 1;
    };

    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
      ];
      xdgAutostart = true;
    };
    
    extraConfig = ''
      source = ./noctalia.conf
    '';
  };
}
