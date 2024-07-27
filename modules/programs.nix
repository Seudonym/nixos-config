{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions = {
      enable = true;
      strategy = [ "match_prev_cmd" ];
    };
  };

  programs.starship = {
    enable = true;
  };
}
