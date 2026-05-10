{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    ../../Features/Server/bentopdf.nix
  ];

  nix = {
    settings = {
      download-buffer-size = 524288000;
      auto-optimise-store = true;
      experimental-features = [ 
        "nix-command" 
        "flakes" 
        "pipe-operators"
      ];      
    };
    
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 7d";
    # };
  };

}
