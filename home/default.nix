{ inputs, config, pkgs, ... }:

{
  imports = [ 
    inputs.ags.homeManagerModules.default
  ];

  
  home.username = "wahid";
  home.homeDirectory = "/home/wahid";

  home.file."wahid/.config/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };

  home.packages = with pkgs; [
    obsidian
    brave
    discord
    spotify

    # Lang tools
    clang
    lua
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.requests
    ]))
    bun

    # Misc
    qbittorrent

    # LSPs
    clang-tools
    pyright
    lua-language-server

    # User packages
    git
    jamesdsp
    zip
    unzip
    fd
    gtksourceview
    dart-sass
    gtk3
    gtk3
    webkitgtk
    accountsservice
    grim
    wl-clipboard
    onlyoffice-bin
    
    asusctl
    supergfxctl
    swappy
    wayshot
    hyprpicker
  ];

  programs.git = {
    enable = true;
    userName = "Wahid Khan";
    userEmail = "wk170179@gmail.com";
  };

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      dart-sass
      gtk3
      webkitgtk
      accountsservice
    ];
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
