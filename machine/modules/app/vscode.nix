{ pkgs, lib, ... }:

let
  inherit (pkgs) vscode-extensions vscode-utils vscode-with-extensions vscodium;

  # gitlens = vscode-utils.extensionFromVscodeMarketplace {
  #   name = "gitlens";
  #   publisher = "eamodio";
  #   version = "17.10.2";
  #   sha256 = "sha256:0lhrw24ilncdczh90jnjx71ld3b626xpk8b9qmwgzzhby89qs417";
  # };

  nix-env-selector = vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-env-selector";
    publisher = "arrterian";
    version = "1.1.0";
    sha256 = "sha256:0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
  };

  editorconfig = vscode-utils.extensionFromVscodeMarketplace {
    name = "editorconfig";
    publisher = "editorconfig";
    version = "0.18.1";
    sha256 = "sha256:pFd1CTJL3xQ3HHzQs3f4R5f6xlCghNh8Kv+3AT/Qrqo=";
  };

  rewrap = vscode-utils.extensionFromVscodeMarketplace {
    name = "rewrap";
    publisher = "stkb";
    version = "17.8.0";
    sha256 = "sha256:0phffzqv1nmwsgcx6abgzbzw95zc0zlnhsjv2grs5mcsgrghl759";
  };

  # language-yesod = vscode-utils.extensionFromVscodeMarketplace {
  #   name = "language-yesod";
  #   publisher = "BIGMOON";
  #   version = "0.9.0";
  #   sha256 = "sha256:77tsTExt+rstjwQGkHIYRckX7KkjiBViMGaWmgRn4+4=";
  # };

  vs_ext = vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions;
      [
        bbenoist.nix # nix
        editorconfig # styling
        rewrap # comment wrap
        # gitlens # git
        # language-yesod # haskell
        nix-env-selector # nix
        
        # dhall.dhall-lang # haskell
        # haskell.haskell justusadam.language-haskell # haskell

        ms-azuretools.vscode-docker # docker
        ms-vscode.cpptools # cpp
        ms-vscode-remote.remote-ssh # ssh

        betterthantomorrow.calva # clojure
        # betterthantomorrow.calva-spritz # clojure

        # anseki.vscode-color # color

        mkhl.direnv # shell

        # tomblind.local-lua-debugger-vscode # lua
        sumneko.lua # lua

        # pinage404.nix-extension-pack # nix
        jnoortheen.nix-ide # nix

        # hoovercj.vscode-power-mode # etc

        ms-python.vscode-pylance # python
        ms-python.debugpy # python
        # ms-python.vscode-python-envs # python

        # slevesque.shader # glsl
        # raczzalan.webgl-glsl-editor # glsl

        # Vue.volar # vue


      ];
  };
in
{
  environment.systemPackages = [ vscodium.fhs ];
}