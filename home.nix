{ config, pkgs, ... }:

{
  home.username = "username";
  home.homeDirectory = "/home/username";
  home.stateVersion = "25.05";
  
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      qcheck = "python3 ~/.config/qtile/config.py && qtile cmd-obj -o cmd -f validate_config";
    };

    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "monospace";
        style = "regular";
      };
      font.size = 16;
    };
  };

  home.packages = with pkgs; [
    bat
    qdirstat
    librewolf
    obs-studio
    krita
    blender
    unity-test
    love
    # unfree
    discord
    steam
    vscode
    unityhub
  ];
}
