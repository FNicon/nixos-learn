{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    androidenv.androidPkgs.androidsdk
  ];

  nixpkgs.config.android_sdk.accept_license = true;
  programs.adb.enable = true;

  users.users.<user>.extraGroups = [
    "adbusers"
    "kvm"
  ];
}