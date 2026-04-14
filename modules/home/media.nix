# modules/home/media.nix
# Media players, editors, creative tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    vlc
    mpv # lightweight alternative to vlc
    ffmpeg # video/audio encoder/decoder
    inkscape
    libreoffice-fresh
    qbittorrent # torrent client
    kicad # PCB / electronics design
  ];
}
