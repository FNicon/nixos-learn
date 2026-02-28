{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # record
    obs-studio
    gpu-screen-recorder-gtk
  ];
  programs.gpu-screen-recorder.enable = true;
}