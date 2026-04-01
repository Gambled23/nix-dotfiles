{ inputs, config, pkgs, lib, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    # extest.enable = true;
    protontricks.enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        LD_AUDIT = "${inputs.sls-steam.packages.${pkgs.system}.sls-steam}/library-inject.so:${inputs.sls-steam.packages.${pkgs.system}.sls-steam}/SLSsteam.so";
        WINEDLLOVERRIDES = "OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b";
      };
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  programs.gamemode.enable = true;


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
