{ inputs, config, pkgs, lib, ... }:

{
  services.sls-steam.config = {
    PlayNotOwnedGames = true;
    DisableFamilyShareLock = true;
    AppIds = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      3035120 # Is This Seat Taken
      3401490 # Replicube
      2239150 # Thronefall
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      3314790 # CloverPit
      2779120 # Modulus Factory Automation
      2416450 # MOUSE: P.I. For Hire
    ];
    AdditionalApps = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      3035120 # Is This Seat Taken
      3401490 # Replicube
      2239150 # Thronefall
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      3314790 # CloverPit
      2779120 # Modulus Factory Automation
      2416450 # MOUSE: P.I. For Hire
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
