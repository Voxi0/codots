# hosts/default/configuration.nix
# Main system configuration. Keep this thin, delegate to modules.
{ config, pkgs, username, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    # ../../modules/server  # uncomment for server setups
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  # Locale (change to yours)
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  # User account
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" "libvirtd" ];
    shell = pkgs.bash;
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Virtualisation
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;  # qemu/kvm
  virtualisation.virtualbox.host.enable = true;

  # Antivirus
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

  # System-wide packages (keep short, most stuff goes in home-manager)
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    pciutils
    usbutils
    gnome-tweaks
    gnome-extension-manager
    efibootmgr
    mokutil
  ];

  # Allow unfree packages (steam, discord, chrome, vscode, etc.)
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}
