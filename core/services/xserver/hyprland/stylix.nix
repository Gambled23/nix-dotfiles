# Home manager file
{ pkgs, ... }: 
let 
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
in
{
  stylix = {
    enable = true;
    autoEnable = true;
    # image = ../../../../wallpaper.jpg;
    base16Scheme = theme;
    
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      # emoji = {
      #   package = pkgs.joypixels;
      #   name = "Joypixels";
      # };
    };

    # cursor = {
    #   package = pkgs.vimix-cursors;
    #   name = "Vimix-cursors";
    #   size = 24;
    # };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    targets = {
      noctalia-shell.enable = false;
      spicetify.enable = false;
      starship.enable = false;
      qt.enable = false;
      gtk.enable = false;
      ghostty.enable = false;
      vicinae.enable = false;
      yazi.enable = false;
      btop.enable = false;
      vscode.enable = false;
      alacritty.enable = false;
      kde.enable = false;
    };
  };
}