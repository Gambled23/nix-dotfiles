{ ... }: {
  flake.nixosModules.devHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ "btusb" "btrtl" "rtw88_8821ce" ];
    boot.kernelModules = [ "kvm-amd" ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/02dcb784-148b-4f3d-97e6-e5ab03c9e6b4";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/8074-DB0D";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [ ];

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
