{ config, pkgs, lib, ... }:
let
  qtile = builtins.getFlake "github:qtile/qtile";
in
{
  nixpkgs.overlays = [
    (self: super: {
      qtile = super.qtile.overrideAttrs(_: rec {
        postInstall = let
          qtileSession = ''
          [Desktop Entry]
          Name=Qtile Wayland
          Comment=Qtile on Wayland
          Exec=qtile start -b wayland
          Type=Application
          '';
          in
          ''
        mkdir -p $out/share/wayland-sessions
        echo "${qtileSession}" > $out/share/wayland-sessions/qtile.desktop
        '';
        passthru.providedSessions = [ "qtile" ];
      });
    })
  ];

  services.xserver.displayManager.sessionPackages = [ pkgs.qtile-unwrapped ];
}
