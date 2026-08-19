{ self, inputs, ... }: {
  flake.homeModules.noctaliaHome = { pkgs, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
      ./_Config/audio.nix
      ./_Config/backdrop.nix
      ./_Config/bar.nix
      ./_Config/battery.nix
      ./_Config/brightness.nix
      ./_Config/calendar.nix
      ./_Config/control-center.nix
      ./_Config/desktop-widgets.nix
      ./_Config/dock.nix
      ./_Config/hooks.nix
      ./_Config/idle.nix
      ./_Config/keybinds.nix
      ./_Config/location.nix
      ./_Config/lockscreen-widgets.nix
      ./_Config/lockscreen.nix
      ./_Config/nightlight.nix
      ./_Config/notification.nix
      ./_Config/osd.nix
      ./_Config/plugins.nix
      ./_Config/shell.nix
      ./_Config/system.nix
      ./_Config/theme.nix
      ./_Config/wallpaper.nix
      ./_Config/weather.nix
      ./_Config/widget.nix
    ];

    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    home.packages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      slurp
      grim
      hyprpicker
      tesseract
      imagemagick
      zbar
      curl
      jq
      bc
      wl-screenrec
      satty
      translate-shell
      ffmpeg_8

      udiskie
      wl-clipboard
      adw-gtk3
      qt6.qtwebsockets 
      (pkgs.callPackage ./_noctalia-update-config.nix { inherit pkgs; })
    ];
  };
}
