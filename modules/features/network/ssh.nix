{ self, inputs, ... }: {
  # SSH Service
  flake.nixosModules.ssh = { pkgs, lib, ... }: {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "gambled" ];
        X11Forwarding = true;
      };
    };
  };

  # Host configurations
  flake.homeModules.ssh = { pkgs, lib, ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "server-gambled" = {
          HostName = "server-gambled";
          User = "gambled";
        };
        "alpha-server" = {
          HostName = "ec2-98-89-51-199.compute-1.amazonaws.com";
          User = "alpha";
          IdentityFile = "~/.ssh/gambled.pem";
        };
        "opc_host" = {
          HostName = "159.54.132.208";
          User = "opc";
          IdentityFile = "~/.ssh/1725397286042.key";
        };
      };
    };
  };
}

# Host server-gambled
#     HostName server-gambled
#     User gambled

# Host administrativo
#     HostName ec2-18-190-131-215.us-east-2.compute.amazonaws.com
#     User ubuntu
#     IdentityFile ~/.ssh/id_ed25519

# Host alpha-server
#     HostName ec2-98-89-51-199.compute-1.amazonaws.com
#     User alpha
#     IdentityFile ~/.ssh/gambled.pem

# Host opc_host
#     HostName 159.54.132.208
#     User opc
#     IdentityFile ~/.ssh/1725397286042.key
