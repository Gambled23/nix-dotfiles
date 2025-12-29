{ lib, inputs, config, pkgs, ... }: 

{
  services.vicinae = {
    enable = true;
    # autoStart = true;
    settings = {
      closeOnFocusLoss = true;
      faviconService = "twenty";
      font = {
        size = 10.5;
      };
      popToRootOnClose = true;
      rootSearch = {
        searchFiles = false;
      };
      # theme = {
      #   iconTheme = "Default";
      #   name = "gruvbox-dark";
      # };
      window = {
        csd = true;
        opacity = lib.mkForce 0.7;
        rounding = 10;
      };
    };

    extensions = [
      (inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.mkVicinaeExtension {
        pname = "Nix";
        src = pkgs.fetchFromGitHub {
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643";
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/nix";
      })
      (inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.mkVicinaeExtension {
        pname = "Hypr Keybinds";
        src = pkgs.fetchFromGitHub {
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643";
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/hypr-keybinds";
      })
      (inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.mkVicinaeExtension {
        pname = "Bluethooth";
        src = pkgs.fetchFromGitHub {
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643";
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/bluetooth";
      })
    ];
  };
}