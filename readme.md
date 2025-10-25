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

rebuild nixos
```bash
su nixos-rebuild switch --flake .
```

update version
```bash
nix flake update
```

