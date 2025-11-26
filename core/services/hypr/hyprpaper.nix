# Home manager file
{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload =
        [ "/etc/nixos/wallpaper.png" ];
      wallpaper = [
        "/etc/nixos/wallpaper.png"
      ];
    };
  };
}