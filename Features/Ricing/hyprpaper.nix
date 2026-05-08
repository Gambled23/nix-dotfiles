# Home manager file
{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload =
        [ "/etc/nixos/wallpaper.jpg" ];
      wallpaper = [
        "/etc/nixos/wallpaper.jpg"
      ];
    };
  };
}