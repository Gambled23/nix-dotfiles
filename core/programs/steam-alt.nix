{ pkgs, lib, ... }:

let
  steamWrapper = pkgs.writeShellScriptBin "steam-wayland" ''
    set -e
    export STEAM_USE_WAYLAND=1
    exec ${pkgs.steam}/bin/steam "$@"
  '';

  steamDesktop = pkgs.makeDesktopItem {
    name = "steam-wayland";
    desktopName = "Steam (Wayland)";
    comment = "Steam client with Wayland environment";
    exec = "steam-wayland";
    icon = "steam";
    categories = [ "Game" ];
    terminal = false;
  };

  steamBundle = pkgs.symlinkJoin {
    name = "steam-wayland-launcher";
    paths = [ steamWrapper steamDesktop ];
  };
in {
  programs.steam = {
    enable = lib.mkDefault true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steamBundle
    steam-run
    mangohud
    protonup
    winetricks
    wineWowPackages.waylandFull
    lact
  ];

  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";

  systemd.packages = [ pkgs.lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}