# Home manager file
{
	inputs,
	pkgs,
	...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
		./Config/audio.nix
		./Config/backdrop.nix
		./Config/bar.nix
		./Config/battery.nix
		./Config/brightness.nix
		./Config/calendar.nix
		./Config/control-center.nix
		./Config/desktop-widgets.nix
		./Config/dock.nix
		./Config/hooks.nix
		./Config/idle.nix
		./Config/keybinds.nix
		./Config/location.nix
		./Config/lockscreen-widgets.nix
		./Config/lockscreen.nix
		./Config/nightlight.nix
		./Config/notification.nix
		./Config/osd.nix
		./Config/plugins.nix
		./Config/shell.nix
		./Config/system.nix
		./Config/theme.nix
		./Config/wallpaper.nix
		./Config/weather.nix
		./Config/widget.nix
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    # For screenshotting and screen recording plugins
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    ffmpeg
    jq
    wl-screenrec
    adw-gtk3 # custom color theme so gtk can use noctalia colors
    qt6.qtwebsockets 
    (import ./noctalia-update-config.nix { inherit pkgs; })
  ];
}
