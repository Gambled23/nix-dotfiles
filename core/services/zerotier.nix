
let
  privateZeroTierInterfaces = [ "ztbso1b6n3" ]; # ZT NET INTERFACE 
in {
  systemd.services.zerotierone.enable = true;
  services.avahi.enable = true;
  services.avahi.allowInterfaces = privateZeroTierInterfaces; # ONLY BROADCAST ON VPN
  services.avahi.ipv6 = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.avahi.publish.addresses = true;
  services.avahi.publish.domain = true;
  services.avahi.nssmdns4 = true;
  services.avahi.publish.workstation = true; # ADDED TO DESKTOP MACHINES

  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ 
    "159924d6307a98fe" #Angry patatas
    "abfd31bd4708f79c" #Rafael Vaca
    ]; # ZT NETWORK ID
}
