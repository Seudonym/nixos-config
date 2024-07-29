{ config, pkgs, inputs, ... }: 

{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    inputs.unstable.legacyPackages."${pkgs.system}".neovim
    git
    fzf
    ripgrep
    wget
    curl
    zoxide
    jamesdsp
    wl-clipboard

    hyprpaper
    brightnessctl

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
