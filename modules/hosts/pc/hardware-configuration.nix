{ ... }: {
  flake.nixosModules.pcHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/c40b6d8a-2aae-4f24-a5ff-a69c5a38ca1c";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/9E2C-2B9D";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    fileSystems."/games" = {
      device = "/dev/disk/by-label/games";
      fsType = "ext4";
    };

    fileSystems."/hdd" = { 
      device = "/dev/disk/by-label/HDD";
      fsType = "ntfs"; 
      options = [ "rw" "uid=1000" ];
    };

    swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
