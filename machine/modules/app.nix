{ config, lib, pkgs, ... }:

{
  imports = [
    ./app/android.nix
    ./app/browser.nix
    ./app/docker.nix
    ./app/gpu_screen_record.nix
    ./app/heroic.nix
    ./app/libreoffice.nix
    ./app/pen_tablet.nix
    ./app/renpy.nix
    ./app/steam.nix
    ./app/vscode.nix
  ];

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
    
    # sns
    discord
    # media player
    vlc

    # bat
    bat
    # stat directory
    qdirstat
    # rar
    unrar-free

    bun
    # 2D
    krita
    # 3D
    blender
    # 3D
    openscad
    # game-engine
    unityhub
    love

    arandr

    # protonplus

    fastfetch

    flameshot

    pwvucontrol

    lmms

    obsidian

    anki

    pciutils

    direnv
    
    clojure
  ];
  programs.nix-ld.enable = true; # dynamic link
  programs.direnv.enable = true; # direnv

  nixpkgs.config.allowUnfree = true;

  programs.coolercontrol.enable = true;
}