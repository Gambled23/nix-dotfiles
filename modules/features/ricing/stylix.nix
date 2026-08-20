{ self, inputs, ... }: {
  flake.homeModules.stylix = { pkgs, ... }: let 
    theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  in {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = theme;
      
      fonts = {
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };

      targets = {
        alacritty.enable = false;
        btop.enable = false;
        ghostty.enable = false;
        kitty = {
          enable = false;
          fonts.enable = false;
          inputs.enable = false;
          opacity.enable = false;
          colors.enable = false;
        };
        gtk.enable = false;
        kde.enable = false;
        nixcord.enable = false;
        noctalia-shell.enable = false;
        noctalia.enable = false;
        qt.enable = false;
        spicetify.enable = false;
        spotify-player.enable = false;
        starship.enable = false;
        vicinae.enable = false;
        vscode.enable = false;
        yazi.enable = false;
      };
    };
  };
}
