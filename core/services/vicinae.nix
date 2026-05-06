{ lib, inputs, config, pkgs, ... }: 

{
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      close_on_focus_loss = true;
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
          # name = lib.mkForce "gruvbox-light";
          icon_theme = "Reversal";
        };
        dark = {
          # name = lib.mkForce "gruvbox-dark";
          icon_theme = "Reversal";
        };
      };
      window = {
        csd = true;
        rounding = 10;
      };
      launcher_window = {
        opacity = lib.mkForce 0.6;
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
        "@Gimblet/vicinae-extension-noctalia-shell-wallpaper-selector-0" = {
          preferences = {
            display_name = "eDP-1";
            wallpaper_directory = "/home/gambled/Pictures/Wallpapers/PC";
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
      chromium-bookmarks
      bluetooth
      ssh
      hypr-keybinds
      player-pilot
      process-manager
      nix
      noctalia-shell-wallpaper-selector
    ];
  };
}