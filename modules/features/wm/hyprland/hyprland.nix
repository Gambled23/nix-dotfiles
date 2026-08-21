{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { config, lib, pkgs, ... }: {
    imports = [
      inputs.monique.nixosModules.default
    ];

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
      kitty
      kdePackages.qttools
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    security.pam.services.hyprlock = {};
    services.gvfs.enable = true;

    services.xserver = {
      dpi = 98;
      enable = true;
      exportConfiguration = true;
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
    };

    networking.firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; }
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; }
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

    services.gnome.gnome-online-accounts.enable = true;
    services.gnome.evolution-data-server.enable = true;
  };
}
