{ pkgs, ... }:
# let
#   endfield = pkgs.fetchFromGitHub {
#     owner = "FNicon";
#     repo = "plymouth_endfield";
#     rev = "master";
#     sha256 = "sha256-XCTMx/d6Ssg+38jb9mt5rYLBdDaiEGhKvlbaHMAe3mg=";
#   }
in
{
  boot = {
    plymouth = {
      enable = true;
      theme = "loading";
      themePackages = with pkgs; [
        (pkgs.callPackage /absolute/path {})
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

  };
}
