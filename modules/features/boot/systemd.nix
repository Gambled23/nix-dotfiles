{ self, inputs, ... }: {
  flake.nixosModules.bootSystemd = { pkgs, ... }: {
    boot = {
      supportedFilesystems = [ "ntfs" ];
      loader = { 
        systemd-boot.enable = true;
      };
    };
  };
}
