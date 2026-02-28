{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # pen tablet
    opentabletdriver
  ];

  hardware.opentabletdriver.enable = true;
}