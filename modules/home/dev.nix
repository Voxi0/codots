# modules/home/dev.nix
# Development tools and languages
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Editors
    vscode # or use vscodium for the de-microsofted version
    micro # terminal editor, simpler than vim

    # Languages and runtimes
    nodejs_22
    python3
    python3Packages.pip
    python3Packages.cython
    gcc
    clang
    gnumake
    cmake
    autoconf
    automake
    libtool
    pkg-config
    flex
    bison
    nasm # x86 assembler
    go # golang
    ruby
    bundler # ruby package manager
    maven # java build tool
    texinfo

    # Containers and VMs
    docker-compose
    qemu
    virt-manager
    virtualbox # virtualbox
    OVMF # UEFI firmware for VMs

    # Tools
    postman
    android-tools # adb, fastboot
    gh # github cli
    powershell # pwsh
  ];
}
