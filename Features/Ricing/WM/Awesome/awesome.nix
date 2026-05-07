

{ config, pkgs, ... }: 

{
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font  = "Noto Sans";
      fontSize = "9";
      loginBackground = false;
      ClockEnabled = true;
      PasswordShowLastLetter=1000;
    }
  )];

  services.xserver = {
    enable = true;
  
    displayManager = {
        sddm.enable = true;
        theme = "catppuccin-frappe";
        package = pkgs.kdePackages.sddm;
        #defaultSession = "none+awesome";
    };


    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];

    };
  };
  services = {
    picom = import ../../compositors/picom.nix { };
  };
}