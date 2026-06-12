{ config, pkgs, lazyvim, ... }:

{
  imports = [ lazyvim.homeManagerModules.default ];
  programs.lazyvim.enable = true;
  home.username = "ph";
  home.homeDirectory = "/home/ph";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    gcc
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
    };
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Pawel Hase";
      email = "pawelhase@gmail.com";
      init.defaultBranch = "main";
    };
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
    };
  };
}
