{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
  boot.blacklistedKernelModules = [
    "nova_core"
    "noveau"
  ];
  boot.kernelParams = [
    "NVreg_UsePageAttributeTable=1" # Nvidia Tweaks
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
  ];
  hardware.graphics = { enable = true; };
  powerManagement.enable = false;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    # forceFullCompositionPipeline = true;
  };
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    # <domain>:<bus>:<device>.<func> to 
    # PCI:<bus>@<domain>:<device>:<func>
    nvidiaBusId = "PCI:1@0:0:0";
    amdgpuBusId = "PCI:13@0:0:0";
  };
  hardware.nvidia-container-toolkit.enable = true;
  hardware.graphics.enable32Bit = true;

}