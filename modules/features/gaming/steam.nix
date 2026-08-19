{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;

      package = pkgs.millennium-steam.override {
        extraEnv = {
          OBS_VKCAPTURE = true;
          LD_AUDIT = "${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/library-inject.so:${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/SLSsteam.so";
          WINEDLLOVERRIDES = "OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b";
        };
      };

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    environment.systemPackages = with pkgs; [
      protonup-ng
      inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.wrapped
      inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
    ];

    nixpkgs.overlays = [
      inputs.millennium.overlays.default
    ];

    services.flatpak.enable = true;
  };
}
