{ self, inputs, lib, ... }: {
  flake.nixosModules.mangowm = { pkgs, ... }: {
    imports = [
      inputs.mangowm.nixosModules.mango
    ];

    disabledModules = [ "programs/wayland/mango.nix" ];

    programs.mango = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Monitors
      wlr-randr
    ];
     
    services.pipewire.enable = true;
    services.dbus.packages = [ pkgs.gcr ];
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = [ "wlr" "gtk" ];
        };
        mango = {
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
          "org.freedesktop.impl.portal.ScreenShot" = [ "wlr" ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome 
      ];
      wlr = {
        enable = true;
        settings = {
          screencast = {
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
          };
        };
      };
    };
  };

  flake.homeModules.mangowmHome = { pkgs, osConfig, ... }: let 
    hostconfig = if osConfig.networking.hostName == "pc-gambled" then ./_hosts/pc-gambled.nix else ./_hosts/dev-gambled.nix;
  in {
    imports = [
      inputs.mangowm.hmModules.mango
      hostconfig
    ] 
    ++ (builtins.filter (lib.hasSuffix ".nix") (lib.filesystem.listFilesRecursive ./_configs))
    ++ (builtins.filter (lib.hasSuffix ".nix") (lib.filesystem.listFilesRecursive ./_rules));

    wayland.windowManager.mango = {
      enable = true;

      settings = {
        exec-once = [
          "systemctl --user restart noctalia"
          "beeper"
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

    services.gnome-keyring = {
      enable = true;
      components = [ "pkcs11" "secrets" "ssh" ];
    };
  };
}
