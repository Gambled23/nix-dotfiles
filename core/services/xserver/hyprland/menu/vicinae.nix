{ inputs, config, pkgs, ... }: 

{
  services.vicinae = {
    enable = true;
    autoStart = true;
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
      theme = {
        iconTheme = "Default";
        name = "gruvbox-dark";
      };
      window = {
        csd = true;
        opacity = 0.98;
        rounding = 10;
      };
    };

    extensions = [
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "Nix";
        src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643"; # If the extension has no releases use the latest commit hash
          # You can get the sha256 by rebuilding once and then copying the output hash from the error message
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/nix"; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
      })
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "Hypr Keybinds";
        src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643"; # If the extension has no releases use the latest commit hash
          # You can get the sha256 by rebuilding once and then copying the output hash from the error message
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/hypr-keybinds"; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
      })
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "Bluethooth";
        src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643"; # If the extension has no releases use the latest commit hash
          # You can get the sha256 by rebuilding once and then copying the output hash from the error message
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/bluetooth"; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
      })
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "WIFI Commander";
        src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643"; # If the extension has no releases use the latest commit hash
          # You can get the sha256 by rebuilding once and then copying the output hash from the error message
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/wifi-commander"; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
      })
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "HTML Symbol Finder";
        src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
          owner = "vicinaehq";
          repo = "extensions";
          rev = "610459553a20cf510fa414844f0d094f14ae9643"; # If the extension has no releases use the latest commit hash
          # You can get the sha256 by rebuilding once and then copying the output hash from the error message
          sha256 = "sha256-z4SqRFhJzAlBhNzgX7wHNZtEDnu5PIypYkBWOJtjyuA=";
        } + "/extensions/html-symbol-finder"; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
      })
    ];
  };
}