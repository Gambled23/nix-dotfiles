{ self, inputs, ... }: {
  flake.nixosModules.printing = { pkgs, ... }: {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        hplipWithPlugin
        # samsung-unified-linux-driver
        # epson-escpr2
        # cnijfilter2
        brlaser
      ];
    };
    
    services.ipp-usb.enable = true;

    environment.systemPackages = with pkgs; [
      system-config-printer
    ];
  };
}
