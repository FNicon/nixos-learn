# https://nixos.wiki/wiki/Steam

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ steam ];
  # To use the gamescope compositor, which enables features such as resolution upscaling and stretched aspect ratios (such as 4:3), set 
  programs.steam.gamescopeSession.enable = true; 

  # Note: Enabling steam installs several unfree packages. If you are using allowUnfreePredicate you will need to ensure that your configurations permit all of them. 
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
  
  # To install the Steam package and enable all the system options necessary to allow it to run:
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

    package = pkgs.steam.override {
     withPrimus = true; # Bumblebee and Primus
     extraPkgs = pkgs: [
        bumblebee # Bumblebee and Primus
        glxinfo # Bumblebee and Primus
        jdk # Java
      ];
    };
  };

  # Java
  programs.java.enable = true;

  # Permission issues with external library folders
  fileSystems."/games" = {
    device = "/dev/disk/by-partuuid/d4eb0828-fdf8-40d8-8a57-3bc825eac476";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount/unmount
      "nofail" # Allows systems to continue to boot if drive cannot be mounted
      "exec"   # Allows execution of files
    ];
  };

  # Some games may distribute on Linux as an AppImage. To get them to execute via Steam, enable AppImage with the binfmt setting: 
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

}