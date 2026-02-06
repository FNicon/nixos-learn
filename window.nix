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
      setupCommands = ''
        /run/current-system/sw/bin/xrandr --output HDMI-A-0 --mode 3840x2160 --primary
        /run/current-system/sw/bin/xrandr --output HDMI-A-1 --mode 3840x2160
        /run/current-system/sw/bin/xrandr --output HDMI-A-2 --mode 3840x2160

        /run/current-system/sw/bin/xrandr --output DisplayPort-0 --mode 1920x1080 -below HDMI-A-0
        /run/current-system/sw/bin/xrandr --output DisplayPort-1 --mode 1920x1080 -below HDMI-A-1
        /run/current-system/sw/bin/xrandr --output DisplayPort-2 --mode 1920x1080 -below HDMI-A-2
      '';
    };
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
}