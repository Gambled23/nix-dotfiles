{...}:
{
  programs.steam = {
    # extest.enable = true;
    # gamescopeSession = {
    #   enable = true;
    #   # args = [
    #   #   "--mangoapp"
    #   # ];
    # };

    package = pkgs.millennium-steam.override {
      extraEnv = {
        # MANGOHUD = true;
        OBS_VKCAPTURE = true;
        LD_AUDIT = "${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/library-inject.so:${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/SLSsteam.so";
        WINEDLLOVERRIDES = "OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b";
      };
    };

  };

  environment.systemPackages = with pkgs; [
    inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.wrapped
    inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
  ];

  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];

  services.flatpak.enable = true; # Enable flatpak
}