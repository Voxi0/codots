# modules/home/media.nix
# Media players, editors, creative tools
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    mpv                 # lightweight alternative to vlc
    ffmpeg              # video/audio encoder/decoder
    inkscape
    gimp
    obs-studio
    kdenlive
    audacity
    libreoffice-fresh
    qbittorrent         # torrent client
    kicad               # PCB / electronics design
  ];
}
