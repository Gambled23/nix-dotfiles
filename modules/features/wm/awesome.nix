{ self, inputs, ... }: {
  flake.nixosModules.awesome = { pkgs, ... }: {
    services.xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          theme = "catppuccin-frappe";
          package = pkgs.kdePackages.sddm;
        };
      };

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };
  };
}
