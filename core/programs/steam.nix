{ inputs, config, pkgs, lib, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    # extest.enable = true;
    protontricks.enable = true;
    gamescopeSession = {
      enable = true;
      # args = [
      #   "--mangoapp"
      # ];
    };
    package = pkgs.millennium-steam.override {
      extraEnv = {
        # MANGOHUD = true;
        # OBS_VKCAPTURE = true;
        LD_AUDIT = "${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/library-inject.so:${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/SLSsteam.so";
        # WINEDLLOVERRIDES = "OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b";
      };
    };


    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
    # args = [
    #   "--mangoapp"
    # ];
  };
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-ng
    inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.wrapped
    gamescope-wsi
  ];

  # jovian = {
  #   steam = {
  #     enable = true;
  #     # autoStart = true;
  #     desktopSession = "plasma";
  #     user = "gambled";
  #     updater.splash = "jovian";
  #   };
  #   decky-loader = {
  #     enable = true;
  #     user = "gambled";
  #   };
  #   hardware.has.amd.gpu = true;
  # };
  # system.userActivationScripts.linktosharedfolder.text = ''
  #   if [[ ! -h "$HOME/.homebrew" ]]; then
  #     ln -s "/var/lib/decky-loader/" "$HOME/.homebrew"
  #   fi
  # '';
}
