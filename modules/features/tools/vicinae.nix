{ self, inputs, ... }: {
  flake.homeModules.vicinae = { lib, config, pkgs, ... }: {
    imports = [
      inputs.vicinae.homeManagerModules.default
    ];
    
    programs.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
      };
      settings = {
        close_on_focus_loss = false;
        consider_preedit = true;
        pop_to_root_on_close = true;
        favicon_service = "twenty";
        launcher_window.layer_shell.enabled = false;
        font = {
          size = 10.5;
        };
        search_files_in_root = true;
        theme = {
          light = {
            icon_theme = "Papirus";
          };
          dark = {
            icon_theme = "Papirus";
          };
        };
        window = {
          csd = true;
          rounding = 10;
        };
        launcher_window = {
          opacity = lib.mkForce 0.5;
        };
        providers = {
          "@knoopx/vicinae-extension-nix-0" = {
            entrypoints = {
              flake-packages = {
                alias = "nixf";
              };
              home-manager-options = {
                alias = "nixh";
              };
              options = {
                alias = "nixo";
              };
              packages = {
                alias = "nixp";
              };
            };
          };
          "@leonkohli/vicinae-extension-process-manager-0" = {
            entrypoints = {
              kill = {
                alias = "kill";
              };
            };
          };
        };
      };

      extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
        ssh
        process-manager
        nix
        zoxide-recent-directories
      ];
    };
  };
}
