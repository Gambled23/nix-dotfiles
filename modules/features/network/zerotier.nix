{ self, inputs, ... }: {
  flake.nixosModules.zerotier = { pkgs, lib, ... }: let
    privateZeroTierInterfaces = [ "ztbso1b6n3" ]; # ZT NET INTERFACE 
  in {
    services.avahi = {
      enable = true;
      openFirewall = true;
      allowInterfaces = privateZeroTierInterfaces; # ONLY BROADCAST ON VPN
      ipv6 = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
        domain = true;
        workstation = true; # ADDED TO DESKTOP MACHINES
      };
      nssmdns4 = true;
    };

    services.zerotierone = {
      enable = true;
      joinNetworks = [ 
        "159924d6307a98fe" # Angry patatas
        "abfd31bd4708f79c" # Rafael Vaca
      ]; # ZT NETWORK ID
    };
  };
}
