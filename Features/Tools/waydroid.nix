{pkgs, ...}:
{
  virtualisation.waydroid.enable = true; # Waydroid
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  environment.systemPackages = [ 
    pkgs.wl-clipboard 
    # pkgs.waydroid-helper 
  ];

  # systemd = {
  #   packages = [ pkgs.waydroid-helper ];
  #   services.waydroid-mount.wantedBy = [ "multi-user.target" ];
  # };
}