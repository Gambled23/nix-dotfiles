{ self, inputs, ... }: {
  flake.nixosModules.docker = { pkgs, ... }: {
    virtualisation.docker.enable = true;
    virtualisation.docker.enableOnBoot = true;
    users.users.gambled.extraGroups = [ "docker" ];
  };
}
