{ config, lib, pkgs, ... }:

{
  # programs.firefox.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.chromium = {
    extraOpts = {
    	"ExtensionManifestV2Availability" = 2;
    };
  };

  environment.systemPackages = with pkgs; [
    librewolf # browser

    (chromium.override {
      commandLineArgs = [
        "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
      ];
      enableWideVine = true; 
    })
  ];

}