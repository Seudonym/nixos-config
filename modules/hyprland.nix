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
    fzf
    ripgrep
    wget
    curl
    zoxide
    wl-clipboard

    swww
    brightnessctl

    
    libnotify
    mako
    

    wofi

    qt5.qtwayland
    qt6.qtwayland

    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

}
