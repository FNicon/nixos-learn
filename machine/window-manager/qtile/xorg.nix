{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      python3 = super.python3.override {
        packageOverrides = python-self: python-super: {
          qtile = python-super.qtile.overrideAttrs (oldAttrs: {
            dontWrapPythonPrograms = true;
            postFixup = ''
              wrapPythonPrograms
              # get rid of PATH magic after wrapper script
              mv $out/bin/.qtile-wrapped $out/bin/qtile
            '';
          });
        };
      };
    })
  ];

  services.xserver = {
    enable = true;
    windowManager = {
      qtile.enable = true;
      session = [
        {
          name = "my-qtile";
          start = let
            qtileSession = ''
              qtile start -b wayland
            '';
              in
            ''
              fastfetch
              python -V
              ${qtileSession}
            '';
        }
      ];
    };
    displayManager = {
      sessionCommands = ''
        ${pkgs.xwallpaper}/bin/xwallpaper --zoom ~/Pictures/wallpapers/image.png
        ${pkgs.xorg.xset}/bin/xset r rate 500 35 &
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    fastfetch
    python315
  ];

  services.picom = {
    enable = true;
    backend = "xrender"; # try "glx" if xrender doesn't help
    fade = true;
    vSync = true;
  };

  services.xserver.resolutions = [
    {
      x = 3840;
      y = 2160;
    }
    {
      x = 1920;
      y = 1080;
    }
  ];

  services.xserver.xrandrHeads = [
    {
      output = "HDMI-A-0";
      monitorConfig = ''
        DisplaySize 3840 2160
      '';
    }
    {
      output = "DisplayPort-0";
      primary = true;
      monitorConfig = ''
        DisplaySize 1920 1080
        Option "Below" "HDMI-A-0"
      '';
    }
    {
      output = "HDMI-A-1";
      monitorConfig = ''
        DisplaySize 3840 2160
      '';
    }
    {
      output = "DisplayPort-1";
      monitorConfig = ''
        DisplaySize 1920 1080
        Option "Below" "HDMI-A-1"
      '';
    }
        {
      output = "HDMI-A-2";
      monitorConfig = ''
        DisplaySize 3840 2160
      '';
    }
    {
      output = "DisplayPort-2";
      monitorConfig = ''
        DisplaySize 1920 1080
        Option "Below" "HDMI-A-2"
      '';
    }
    {
      output = "HDMI-A-3";
      monitorConfig = ''
        DisplaySize 3840 2160
      '';
    }
    {
      output = "DisplayPort-3";
      monitorConfig = ''
        DisplaySize 1920 1080
        Option "Below" "HDMI-A-3"
      '';
    }
  ];
}