{ inputs, config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  virtualisation.docker.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  programs.waybar.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
  };

  services = {
    supergfxd.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    #media-session.enable = true;
  };

  services.printing.enable = true;
  services.openssh.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    vistafonts
    noto-fonts
  ];

  networking.hostName = "zephyrus"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    # pam.services.hyprlock = {};
  };
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };


  nixpkgs.config.allowUnfree = true;
  users.users.wahid = {
    isNormalUser = true;
    description = "Wahid Khan";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    packages = with pkgs; [
    	brave
      ghostty
      xfce.thunar
      siyuan
      onlyoffice-desktopeditors
      obsidian
      qbittorrent-enhanced
    ];
  };

  environment.systemPackages = with pkgs; [
    gcc
    (python3.withPackages (python-pkgs: with python-pkgs; [ watchdog ]))
    llvmPackages_19.libcxxClang
    llvmPackages_19.clang-tools
    cargo
    rustc
    rustfmt
    rust-analyzer
    lua-language-server
    nil

  	neovim
    ripgrep
    ntfs3g
    wget
    git
    stow
    gh
    killall
    curl

    adw-gtk3
    adwaita-icon-theme
    pywal

    cava
    waypaper
    bemenu
    swww
    mpv
    mpvpaper
    yt-dlp

    hyprpolkitagent
    hyprshot
    hyprlock
    brightnessctl
    pavucontrol
    wl-clipboard
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
