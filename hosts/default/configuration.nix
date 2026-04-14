# Main system configuration. Keep this thin, delegate to modules.
{
  pkgs,
  username,
  hostname,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    # ../../modules/server  # uncomment for server setups
  ];

  # Nix settings
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  # Locale (change to yours)
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  # User account
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video" "audio" "docker" "libvirtd"];
    shell = pkgs.bash;
  };

  # Virtualisation
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true; # qemu/kvm
    virtualbox.host.enable = true;
  };

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

  system.stateVersion = "25.11";
}
