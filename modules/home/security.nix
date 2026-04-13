# modules/home/security.nix
# Security, pentesting and network analysis tools
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Network
    nmap                 # network scanner
    wireshark            # packet analyzer
    netcat-openbsd       # nc (networking utility)
    net-snmp             # snmp tools
    inetutils               # telnet client

    # Password / Cracking
    john                 # john the ripper
    hydra                # brute-force login cracker

    # Antivirus
    clamav               # open-source antivirus

    # General
    net-tools            # ifconfig, netstat, etc.
  ];
}
