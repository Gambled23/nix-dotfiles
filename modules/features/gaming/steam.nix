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

  flake.homeModules.steamHome = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      inputs.sls-steam.homeModules.sls-steam
    ];

    services.sls-steam.config = {
      PlayNotOwnedGames = true;
      DisableFamilyShareLock = true;
      SafeMode = true;

      AppIds = [
        2868840 # Slay the Spire 2
        2356780 # Dungeon Clawler
        3035120 # Is This Seat Taken
        2968420 # PowerWash Simulator 2
        3265700 # Vampire crawlers
        1147860 # UFO 50
        1299460 # Wanderstop
        2097570 # StarVaders
        2612700 # S4U CITYPUNK 2011 AND LOVE PUNCH
        1539140 # STONKS9800 Stock Market Simulator
        3833760 # You Know The Drill
        2914150 # Yunyun Syndrome Rhythm Psychosis
        2615540 # voidbreaker
        773670 # Delete
        942050 # 2048 
        3404260 # Dead as Disco
        2830030 # MOTORSLICE
        993090 # Lossless Scaling
        2524850 # Denshattack
        1084020 # TheoTown
      ];

      AdditionalApps = [
        2868840 # Slay the Spire 2
        2356780 # Dungeon Clawler
        3035120 # Is This Seat Taken
        2968420 # PowerWash Simulator 2
        3265700 # Vampire crawlers
        1147860 # UFO 50
        1299460 # Wanderstop
        2097570 # StarVaders
        2612700 # S4U CITYPUNK 2011 AND LOVE PUNCH
        1539140 # STONKS9800 Stock Market Simulator
        3833760 # You Know The Drill
        2914150 # Yunyun Syndrome Rhythm Psychosis
        2615540 # voidbreaker
        773670 # Delete
        942050 # 2048 
        3404260 # Dead as Disco
        2830030 # MOTORSLICE
        993090 # Lossless Scaling
        2524850 # Denshattack
        1084020 # TheoTown
      ];
      
      # For multiplayer
      FakeAppIds = {
        "0" = 480;
      };
    };

    home.packages = with pkgs; [
      inputs.accela.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
