{ config, pkgs, ... }: 

{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    fzf
    ripgrep
    wget
    curl
    zoxide
    jamesdsp
    wl-clipboard

    zip
    unzip
    wofi

    qt5.qtwayland
    qt6.qtwayland

    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}
