{ config, lib, pkgs, ... }:

let
  nix-user = "alice";
in
{
  virtualisation = {
    # as systemd
    # oci-containers = {
    #   backend = "docker";
    #   containers = {
    #     foo = {
    #       # ...
    #     };
    #   };
    # };
    docker = {
      enable = true; # Installation
      
      # Rootless docker
      rootless = {
        enable = true;
        setSocketVariable = true;
      };

      # The docker daemon settings are pretty extensive
      daemon.settings = {
        userland-proxy = false;
        experimental = true;
        metrics-addr = "0.0.0.0:9323";
        ipv6 = true;
        fixed-cidr-v6 = "fd00::/80";
      };
    };
  };

  # Adding users to the docker group will provide them access to the socket after a restart: 
  users.users."${nix-user}".extraGroups = [ "docker" ];

  # Note: If you use the btrfs filesystem, you might need to set the storageDriver option: 
  # virtualisation.docker.storageDriver = "btrfs";
}