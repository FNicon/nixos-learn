{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
    displayManager = {
      sessionCommands = ''
        xwallpaper --zoom ~/Pictures/wallpapers/image.png
        xset r rate 500 35 &
      '';
    };
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
      primary = true;
      monitorConfig = ''
        DisplaySize 3840 2160
      '';
    }
    {
      output = "DisplayPort-0";
      monitorConfig = ''
        DisplaySize 1920 1080
        Option "Below" "HDMI-A-0"
      '';
    }
  ];

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };
}