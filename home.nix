{ config, pkgs, ... }:

{
  home.username = "ph";
  home.homeDirectory = "/home/ph";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo nixos btw bitch";
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
