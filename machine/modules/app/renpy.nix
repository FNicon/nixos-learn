{ config, lib, pkgs, ... }:

{
  # nixpkgs.overlays = [
  #   (self: super: {
  #     renpy = super.renpy.overrideAttrs (oldAttrs: {
  #       version = "8.5.2";
  #     });
  #   })
  # ];

  nixpkgs.config.permittedInsecurePackages = [
    "python3.12-ecdsa-0.19.1"
  ];

  environment.systemPackages = with pkgs; [
    renpy
  ];
}