## Nixos

Operating system

rebuild nix os

```bash
su nixos-rebuild switch
```

update

```bash
su nixos-rebuild switch --upgrade
```

reboot

```bash
su reboot
```

```bash
cp -R ~/Projects/nixos/nixos-dotfiles/configuration.nix /etc/nixos/configuration.nix
```

## Vim

```bash
vim /etc/nixos/configuration.nix
```

## XRandr

```bash
xrandr --output <main> --mode <res> --output <secondary> --mode <res> --below <main> 
```

## Alacritty

Terminal Settings

copy setting

```bash
cp -R ~/.config/alacritty ~/Projects/nixos/nixos-dotfiles/system/alacritty
```

## QTile

Window Tile Manager

copy setting

```bash
cp -R ~/.config/qtile ~/Projects/nixos/nixos-dotfiles/system/qtile
```

auto restart qtile

```
super + ctrl + r
```

## Flake

Version manager

| Note : not recommended to use flake.

rebuild nixos
```bash
su nixos-rebuild switch --flake .
```

update version
```bash
nix flake update
```

## Plymouth

cool splash screen

```bash
sudo plymouthd
sudo plymouth --show-splash
sudo plymouth quit
```

## Error log

```bash
journalctl -b -p crit
```

ctrl + alt + f2 if gui error and check /etc/configuration.nix

## NVIDIA

https://wiki.nixos.org/wiki/NVIDIA

```bash
nix shell nixpkgs#pciutils -c lspci -D -d ::03xx
```

## Nixos upgrade

https://nixos.org/manual/nixos/stable/#sec-upgrading

```bash
nix-channel --list

nix-channel --remove nixos

nix-channel --add https://channels.nixos.org/channel-name nixos

nix-channel --update

nixos-rebuild boot --upgrade-all
```

