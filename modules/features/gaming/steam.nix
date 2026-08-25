{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

      package = pkgs.millennium-steam.override {
        extraEnv = {
          OBS_VKCAPTURE = true;
          LD_AUDIT = "${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/library-inject.so:${inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam}/SLSsteam.so";
          WINEDLLOVERRIDES = "OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b";
        };
      };
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

  flake.homeModules.sls-steam = { pkgs, ... }: {
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
        942050 # 2048 
        993090 # Lossless Scaling
        1084020 # TheoTown
        2459550 # Emberward
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
        942050 # 2048 
        993090 # Lossless Scaling
        1084020 # TheoTown
        2459550 # Emberward
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

  flake.nixosModules.jovian = { pkgs, ... }: {
    imports = [
      inputs.jovian-nixos.nixosModules.default
    ];

    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    programs.gamemode.enable = true;

    jovian = {
      steam = {
        enable = true;
        user = "gambled";
        updater.splash = "jovian";
      };
      decky-loader = {
        enable = true;
        user = "gambled";
      };
      hardware.has.amd.gpu = true;
    };

    system.userActivationScripts.linktosharedfolder.text = ''
      if [[ ! -h "$HOME/.homebrew" ]]; then
        ln -s "/var/lib/decky-loader/" "$HOME/.homebrew"
      fi
    '';
  };

  flake.nixosModules.nix-crab = { pkgs, ... }: {
    imports = [
      inputs.nix-crab.nixosModules.default
    ];

    programs.nix-crab = {
      cloudredirect.enable = true;
      cloudredirect.moon.enable = false;
      millennium.enable = true;
      slssteam.enable = true;
      slssteam-moon.enable = false;
    };
  };

  flake.homeModules.nix-crab = { ... }: {
    imports = [
      inputs.nix-crab.homeModules.default
    ];

    programs.nix-crab = {
      slssteam.manageConfig = true;
      steamidra.enable = true;
      accela.enable = true;
      luatools.enable = true;
      cloudredirect.moon.enable = true;

      millennium = {
        plugins = [
          "7913678dca95" # ProtonDB
          "ade101371bfd" # Global launch options
          "266c815057f2" # Steam librarian
          "f685622bace6" # HLTB
          "e73371b61eef" # Size on disk
          "2519c8a9fc97" # Easy steamgrid
          "02bed50d10a8" # Non steam playtime
          "788ed8554492" # Extendium
        ];
        themes = [ 
          "ipYjqODds05KMcvh7QJn" # Material
          "hvGem3YVgRwPdDumShwq" # Juxtematic
          "i3soOaPP2V7P0VO7W4pq" # QOL toggles
        ];
      };
    };
  };
}
