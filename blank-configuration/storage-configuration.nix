{ config, pkgs, modulesPath, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
      systemd.enable = true;
    };
    kernelParams = [ "fbcon=rotate:3"];
    kernelModules = [ "kvm-intel" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # swapDevices = [{
  #     device = "/swapfile";
  #     size = 64 * 1024;
  #   }];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };
  };
}
