{ config, pkgs, lib, modulesPath, ... }:

{
  networking = {
  hostName = "futro";
  useDHCP = lib.mkDefault true;
  networkmanager.enable = true;
  firewall.allowedTCPPorts = [ 3000 80 ];
  firewall.allowedUDPPorts = [ 53 ];
  interfaces.eno1 = {
  #   ipv6.addresses = [{
  #     address = "2a01:4f8:1c1b:16d0::1";
  #     prefixLength = 64;
  #   }];
    ipv4.addresses = [{
      address = "10.0.0.42";
      prefixLength = 24;
    }];
  };
  defaultGateway = {
    address = "10.0.0.1";
    interface = "eno1";
  };
  # defaultGateway6 = {
  #   address = "fe80::1";
  #   interface = "ens3";
  # };
  };
}
