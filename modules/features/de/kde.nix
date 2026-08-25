{ self, inputs, ... }: {
  flake.nixosModules.kde = { config, lib, pkgs, ... }: {
    services.desktopManager.plasma6.enable = true;
    services.displayManager = {
      defaultSession = "hyprland-uwsm";
      autoLogin.enable = true;
      autoLogin.user = "gambled";
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
      };
    };

    services.xserver = {
      dpi = 98;
      enable = true;
      exportConfiguration = true;
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
    };

    environment.systemPackages = with pkgs; [
      kdePackages.krohnkite
      kdePackages.plasma-browser-integration
      kdePackages.kaccounts-integration
      kdePackages.kaccounts-providers
      kdePackages.packagekit-qt
      kdePackages.signond
      kdePackages.krfb
      kdePackages.krdc
      kdePackages.kio-gdrive
      kdePackages.kio-admin
      kdePackages.kio-fuse
      kdePackages.kio-extras
      kdePackages.ktorrent
      kdePackages.libktorrent
      kdePackages.kclock
      kdePackages.kalk
      kdePackages.kate
      kdePackages.qtwayland

      plasmusic-toolbar
      plasma-panel-colorizer
      headsetcontrol
      plasma-applet-commandoutput

      vscode-runner
      pipewire
      wireplumber
    ];

    programs.partition-manager.enable = true;
    programs.kdeconnect.enable = true;

    networking.firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
      allowedUDPPorts = [
        5353
        47998
        47999
        48000
        48002
        48010
        7236
      ];
      allowedTCPPorts = [
        59999
        47984
        47989
        48010
        7236
        7250
      ];
    };
  };
}
