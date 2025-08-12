{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "wahid";
  home.homeDirectory = "/home/wahid";

  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Session variables
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # KDE
    papirus-icon-theme

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    nmap # A utility for network discovery and security auditing
    file
    which
    tree
    fd # Faster find alternative
    bat # Better cat alternative
    dua
    wl-clipboard

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # nvim tools
    lua-language-server
    stylua
    nil
    alejandra
    gcc
    nodejs
    marksman
    # lemminx

    # daily tools
    inputs.zen-browser.packages."${pkgs.system}".default
    chromium
    obsidian
    protonup
    discord
    #spotify
    onlyoffice-desktopeditors
    jamesdsp
    gemini-cli
    zed-editor
  ];

  # Spicetify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      beautifulLyrics
      fullAppDisplay
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      lyricsPlus
    ];
  };

  # KDEConnect
  services.kdeconnect.enable = true;

  # Git
  programs.git = {
    enable = true;
    extraConfig = {
      url = {
        "https://github.com/Seudonym/" = {
          insteadOf = "gh:";
        };
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      append = true;
      share = true;
      size = 10000;
      save = 10000;
      saveNoDups = true;
      ignoreSpace = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      ls = "eza";
      gs = "git status --short";
      gcl = "git clone";
    };
    initContent = ''
      bindkey '\e[3~' delete-char
      bindkey '^R' history-incremental-search-backward # ctrl + r
      bindkey -M viins '^[[3;5~' kill-word
      bindkey '^H' vi-backward-kill-word # ctr + backspace
      bindkey '^[[1;5C' forward-word # ctrl  + right
      bindkey '^[[1;5D' backward-word # ctrl  + left
      bindkey '^[[H' beginning-of-line # home
      bindkey '^[[F' end-of-line # end
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
