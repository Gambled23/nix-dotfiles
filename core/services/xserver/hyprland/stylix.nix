# Home manager file
{ pkgs, ... }: 
let 
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
in
{
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../../../../wallpaper.png;
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
    cursor = {
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 24;
    };
  };
}