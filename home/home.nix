{
  pkgs,
  lib,
  username,
  secrets,
  ...
}: let
  email = "tangtang2995@gmail.com";
  customHelloPkg = pkgs.callPackage ../programs/hello.nix {};
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  home.keyboard = {
    layout = "us";
  };
  home.packages = with pkgs;
    [
      fd
      bottom
      dust
      fastfetch
      wslu
      customHelloPkg
    ];
  home.sessionVariables = {
    BROWSER = "wslview";
    EDITOR = "nvim";
  };

  # zellij static config file (because limitation in nix to kdl converter)
  xdg.configFile."zellij/config.kdl".source = ../config/zellij.kdl;

  programs =
    {
      home-manager.enable = true;
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting # Disable greeting
        '';
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      eza = {
        enable = true;
        icons = "auto";
      };
      zoxide.enable = true;
      starship.enable = true;
      fzf.enable = true;
      yazi.enable = true;
      zellij.enable = true;
      git = import ../programs/git.nix {
        inherit email;
      };
      delta = {
        enable = true;
        enableGitIntegration = true;
      };
      lazygit.enable = true;
      neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
      };
    };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
