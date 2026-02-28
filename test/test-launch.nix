let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.testers.runNixOSTest {
  name = "minimal-test";

  nodes.machine = { config, pkgs, ... }: {
    imports = [ 
      ./../machine/configuration.nix
    ];
  };

  testScript = ''
    machine.wait_for_unit("default.target")
    machine.succeed("su -- root -c 'which firefox'")
  '';
}