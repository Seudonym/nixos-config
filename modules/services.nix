{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.openssh.enable = true;
  services.printing.enable = true;
}
