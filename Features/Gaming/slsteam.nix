{ inputs, config, pkgs, lib, ... }:

{
  services.sls-steam.config = {
    PlayNotOwnedGames = true;
    DisableFamilyShareLock = true;
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
    SafeMode = true;
  };

  programs.mangohud = {
    enable = true;
    settings = {
      toggle_hud = "F11";
    };
  };
}
