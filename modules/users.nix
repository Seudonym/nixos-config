{ config, pkgs, ... }:

{
  users.users.wahid = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      brave
      obsidian 
      discord
      spotify
      vscode
      alacritty
    ];
  };
}
