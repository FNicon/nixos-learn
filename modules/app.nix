{ config, lib, pkgs, ... }:

{
  programs.firefox.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # editor
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # fetch http
    wget
    # editor
    neovim
    # terminal
    alacritty
    # monitor
    (btop.override { rocmSupport = true; cudaSupport = true; })
    # ui editor
    gedit
    # wallpaper
    xwallpaper
    # pc manager
    pcmanfm
    # theme
    rofi
    # git
    git
    # sys info
    pfetch
    # app image run
    appimage-run
    
    # browser
    librewolf
    # sns
    discord
    # game
    steam
    # media player
    vlc

    # pen tablet
    opentabletdriver
    # bat
    bat
    # stat directory
    qdirstat
    # rar
    unrar-free

    # editor
    vscode
    # programming
    python313Packages.python
    python313Packages.pip
    bun
    # record
    obs-studio
    gpu-screen-recorder-gtk
    # 2D
    krita
    # 3D
    blender
    # 3D
    openscad
    # game-engine
    # renpy
    unityhub
    love

    arandr

    # protonplus

    fastfetch

    flameshot

    pwvucontrol

    libreoffice-qt
    hunspell
    hunspellDicts.en-us
    hunspellDicts.id_id

    lmms

    obsidian

    pkgs.anki

    androidenv.androidPkgs.androidsdk
    
    (heroic.override {
      extraPkgs = pkgs': with pkgs'; [
        gamescope
        gamemode
      ];
    })
  ];
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  nixpkgs.config.android_sdk.accept_license = true;
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gpu-screen-recorder.enable = true;

  hardware.opentabletdriver.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs.coolercontrol.enable = true;
}