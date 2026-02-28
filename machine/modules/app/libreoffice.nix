{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en-us
    hunspellDicts.id_id
  ];
}