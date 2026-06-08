{ inputs, config, pkgs, lib, ... }:

{
  services.sls-steam.config = {
    PlayNotOwnedGames = true;
    DisableFamilyShareLock = true;
    AppIds = [
      2868840 # Slay the Spire 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      3035120 # Is This Seat Taken
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      3265700 # Vampire crawlers
      1147860 # UFO 50
      1299460 # Wanderstop
      2097570 # StarVaders
      2612700 # S4U CITYPUNK 2011 AND LOVE PUNCH
      1539140 # STONKS9800 Stock Market Simulator
      2581950 # Tiny Aquarium
    ];
    AdditionalApps = [
      2868840 # Slay the Spire 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      3035120 # Is This Seat Taken
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      3265700 # Vampire crawlers
      1147860 # UFO 50
      1299460 # Wanderstop
      2097570 # StarVaders
      2612700 # S4U CITYPUNK 2011 AND LOVE PUNCH
      1539140 # STONKS9800 Stock Market Simulator
      2581950 # Tiny Aquarium
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
