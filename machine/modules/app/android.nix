{ config, lib, pkgs, ... }:
let
  nix-user = "alice";
in
{
  environment.systemPackages = with pkgs; [
    androidenv.androidPkgs.androidsdk
  ];

  nixpkgs.config.android_sdk.accept_license = true;
  programs.adb.enable = true;

  users.users."${nix-user}".extraGroups = [
    "adbusers"
    "kvm"
  ];
}