# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
  # let
  #   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
  # in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # (import "${home-manager}/nixos")
    ];

  # home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;
  # home-manager.backupFileExtension = "backup";
  # home-manager.users.username = import ./home.nix;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
   ];
  };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
    displayManager.sessionCommands = ''
      xwallpaper --zoom ~/Pictures/wallpapers/image.png
      xset r rate 500 35 &
    '';
    setupCommands = ''
      /run/current-system/sw/bin/xrandr --output HDMI-A-0 --mode 3840x2160 --primary
      /run/current-system/sw/bin/xrandr --output HDMI-A-1 --mode 3840x2160
      /run/current-system/sw/bin/xrandr --output HDMI-A-2 --mode 3840x2160

      /run/current-system/sw/bin/xrandr --output DisplayPort-0 --mode 1920x1080 -below HDMI-A-0
      /run/current-system/sw/bin/xrandr --output DisplayPort-1 --mode 1920x1080 -below HDMI-A-1
      /run/current-system/sw/bin/xrandr --output DisplayPort-2 --mode 1920x1080 -below HDMI-A-2
    '';
  };
  # services.xserver.resolutions = [
  #   {
  #     x = 3840;
  #     y = 2160;
  #   }
  #   {
  #     x = 1920;
  #     y = 1080;
  #   }
  # ];
  # services.xserver.xrandrHeads = [
  #   {
  #     output = "HDMI-A-2";
  #     primary = true;
  #     monitorConfig = ''
  #       DisplaySize 3840 2160
  #     '';
  #   }
  #   {
  #     output = "DisplayPort-2";
  #     monitorConfig = ''
  #       DisplaySize 1920 1080
  #       Option "Below" "HDMI-3"
  #     '';
  #   }
  # ];

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.username = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

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

    protonplus

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
  ];
  
  nixpkgs.config.allowUnfree = true;
  
  fonts.packages = with pkgs; [
    carlito
    dejavu_fonts
    ipafont
    kochi-substitute
    source-code-pro
    ttf_bitstream_vera
    corefonts
    vista-fonts
  ];
  
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "DejaVu Sans Mono"
      "IPAGothic"
    ];
    sansSerif = [
      "DejaVu Sans"
      "IPAPGothic"
    ];
    serif = [
      "DejaVu Serif"
      "IPAPMincho"
    ];
  };
  
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      # fcitx5-mozc
      fcitx5-mozc-ut
      fcitx5-gtk
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gpu-screen-recorder.enable = true;

  hardware.opentabletdriver.enable = true;

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
  boot.blacklistedKernelModule = ["nova_core"];
  hardware.graphics = { enable = true; };
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    forceFullCompositionPipeline = true;
  };
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    nvidiaBusId = "PCI:1@0:0:0";
    amdgpuBusId = "PCI:5@0:0:0";
  };
  hardware.nvidia-container-toolkit.enable = true;
  hardware.graphics.enable32Bit = true;

  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
        # "127.0.0.1" #unbound
        "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };
      #Enable Blocking of certain domains.
      blocking = {
        denylists = {
          "pro" = [ "https://codeberg.org/hagezi/mirror2/raw/branch/main/dns-blocklists/wildcard/pro.txt" ];
          "tif" = [ "https://codeberg.org/hagezi/mirror2/raw/branch/main/dns-blocklists/wildcard/tif.txt" ];
        };
        #Configure what block categories are used
        clientGroupsBlock = {
          default = [ "pro" "tif"];
        };
        loading = {
          downloads = {
            attempts = 8;
            cooldown = "2s";
          };
          strategy = "fast";
          concurrency = 1;
        };
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs.coolercontrol.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

