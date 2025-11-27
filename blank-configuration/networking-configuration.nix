{ config, pkgs, lib, modulesPath, ... }:

{
  networking.hostName = "futro";
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 3000 80 ];
  networking.firewall.allowedUDPPorts = [ 53 ];
}
