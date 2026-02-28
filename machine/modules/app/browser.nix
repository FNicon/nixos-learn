{ config, lib, pkgs, ... }:

{
  programs.firefox.enable = true;


  firefox = {
    enableGoogleTalkPlugin = true;
  };

  chromium = {
    enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
  };

  environment.systemPackages = with pkgs; [
    librewolf # browser
  ];
}