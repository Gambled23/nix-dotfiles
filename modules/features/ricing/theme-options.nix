{ self, ... }: let
  themeModule = { lib, pkgs, ... }: {
    options.theme = {
      iconTheme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Colloid-Light";
          description = "Global icon theme";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.colloid-icon-theme;
          description = "Global icon theme package";
        };
      };
      cursorTheme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Colloid-dark-cursors";
          description = "Global cursor theme";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.colloid-cursors;
          description = "Global cursor theme package";
        };
      };
    };
  };
in {
  flake.homeModules.themeOptions = themeModule;
  flake.nixosModules.themeOptions = themeModule;
}
