{ config, lib, modulesPath, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };
  };
}