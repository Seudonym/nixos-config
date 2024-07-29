{ config, pkgs, ... }:

{
  home.username = "wahid";
  home.homeDirectory = "/home/wahid";

  home.packages = with pkgs; [
    neofetch
  ];

    programs.git = {
      enable = true;
      userName = "Wahid Khan";
      userEmail = "wk170179@gmail.com";
    };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
