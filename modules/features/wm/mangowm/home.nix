{ self, inputs, ... }: {
  flake.homeModules.mangowmHome = { pkgs, osConfig, ... }: let 
    hostconfig = if osConfig.networking.hostName == "pc-gambled" then ./_hosts/pc-gambled.nix else ./_hosts/dev-gambled.nix;
  in {
    imports = [
      inputs.mangowm.hmModules.mango

      hostconfig
      ./_configs/binds.nix
      ./_configs/window-effects.nix
      ./_configs/animations.nix
      ./_configs/input.nix
      ./_rules/window.nix
      ./_rules/layer.nix
      ./_rules/tags.nix
    ];

    services.gnome-keyring = {
      enable = true;
      components = [ "pkcs11" "secrets" "ssh" ];
    };

    wayland.windowManager.mango = {
      enable = true;

      settings = {
        exec-once = [
          "spotify"
          "discord"
          "kdeconnect-indicator"
          "wl-clip-persist --clipboard regular --reconnect-tries 0"
          "wl-paste --type text --watch cliphist store"
        ];
        enable_floating_snap = 1;
        snap_distance = 30;
        allow_tearing = 1;
        syncobj_enable = 1; # Enable drm_syncobj timeline support
        tag_carousel = 1;
        drag_tile_to_tile = 1;
        drag_corner = 4;
        scratchpad_cross_monitor = 1;
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
  };
}
