{ self, inputs, ... }: {
  flake.nixosModules.tailscale = { pkgs, lib, ... }: {
    services.tailscale = {
      enable = true;
      # Open UDP port 41641 to facilitate direct peer-to-peer WireGuard connections
      openFirewall = true;
      # Enables IP forwarding and sets reverse path filtering to loose
      useRoutingFeatures = "both";
    };

    networking.firewall = {
      # Relax reverse path filter so packets via Tailscale's WireGuard interface aren't dropped
      checkReversePath = "loose";
      # Trust the tailscale interface so all internal traffic (SSH, Sunshine, Syncthing, etc.) is allowed
      trustedInterfaces = [ "tailscale0" ];
    };
  };
}
