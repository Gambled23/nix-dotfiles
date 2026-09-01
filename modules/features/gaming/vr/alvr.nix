{ self, inputs, ... }: {
  flake.nixosModules.alvr = { pkgs, ... }: {
    programs.alvr = {
      enable = true;
      openFirewall = true;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.kdePackages.xdg-desktop-portal-kde
      ];
    };
  };
}
