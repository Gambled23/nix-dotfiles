
let
  privateZeroTierInterfaces = [ "ztbso1b6n3" ]; # ZT NET INTERFACE 
in {
  system.stateVersion = "23.11";
  
  services.avahi.enable = true;
  services.avahi.interfaces = privateZeroTierInterfaces; # ONLY BROADCAST ON VPN
  services.avahi.ipv6 = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.avahi.publish.addresses = true;
  services.avahi.publish.domain = true;
  services.avahi.nssmdns = true;
  services.avahi.publish.workstation = true; # ADDED TO DESKTOP MACHINES

  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ "159924d6307a98fe" ]; # ZT NETWORK ID
}
