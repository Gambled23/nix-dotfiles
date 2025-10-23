{ ... }: {
  services.dunst = {
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