{ config, pkgs, ... }:

{

# Packages
environment.systemPackages = with pkgs; [ tdesktop spotify slack audacity libsForQt5.kdenlive sublime4 audacity gnome.geary wezterm onlyoffice-bin emacs vscode gimp element-desktop spotify libreoffice-fresh obsidian obs-studio discord marktext gparted microsoft-edge blender krita gimp mpv alacritty aria2 nim tmate wget rustup go git python310 vte gcc btop ifuse bat exa cmake gnumake fzf yt-dlp tmux hyfetch tilix gzip pfetch neovim figlet virt-manager distrobox nushell libreoffice-fresh codeblocks vmware-workstation gnome.geary amberol gcolor3 fragments apostrophe blanket wike gnome-builder flatpak-builder jetbrains.pycharm-community gnome.gnome-terminal gnome.gnome-tweaks papirus-icon-theme neovide xfce.xfce4-settings 
  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  htop
  dmenu #application launcher most people use
  vim
  gnvim
  utm
  zsh
  virt-manager
  qemu
  chromium
  google-chrome
  ungoogled-chromium 
  vscode
  jetbrains.webstorm
  python39Packages.python
  python27Full
  leafpad
  xorg.xbacklight 
  obs-studio
  ### General utils ###
  bat
  ranger
  wlr-randr
  wlrctl
  wlroots
  waybar
  libsForQt5.libkscreen
  light
  tofi
  brightnessctl
  vokoscreen

  ### Exploitation ###
  metasploit
  sqlmap


  # ### Forensics ###
  capstone
  ddrescue
  ext4magic
  extundelete
  ghidra-bin
  git
  p0f
  pdf-parser
  python39Packages.binwalk
  sleuthkit
  # python310Packages.pysqlcipher3
  # volatility3
  

  ### Hardware ###
  apktool

  ### Recon ###
  cloudbrute
  dnsenum
  dnsrecon
  enum4linux
  hping
  masscan
  netcat
  nmap
  ntopng
  sn0int
  sslsplit
  theharvester
  wireshark
  # wireshark-cli

  ### Backdoors ###
  httptunnel
  pwnat

  ### Passwords ###
  brutespray
  chntpw
  crowbar
  crunch
  hashcat
  hcxtools
  john
  #python311Packages.patator
  phrasendrescher
  thc-hydra

  ### Reverse ###
  binutils
  elfutils
  jd-gui
  patchelf
  radare2
  radare2-cutter
  retdec
  snowman
  valgrind
  yara

  ### Sniffing ###
  bettercap
  dsniff
  mitmproxy
  rshijack
  sipp
  sniffglue

  ### Vuln analisys ###
  grype
  lynis
  sqlmap
  vulnix

  ### Web ###
  burpsuite
  dirb
  gobuster
  urlhunter
  wfuzz
  wpscan
  zap

  #Some things that I used to use
  mate.caja
  gnome.gnome-terminal
  kitty
  alacritty
  rofi
  feh
  gnomeExtensions.pop-shell
  gnome.gnome-tweaks
  gnome.gnome-shell-extensions
  picom
  blueman
  xflux
  xflux-gui
  xorg.xkill
  kate
  skypeforlinux
  scrot
  vscodium

  #photo
  gimp-with-plugins
  

  #vietnamese, still not figure that out
  ibus-engines.bamboo
  
  #dev things
  mongodb
  nodejs-16_x
  openssl
  tmux

];

 # Blueman
 services.blueman.enable = true; 
 

 # Virt-Manager
 virtualisation.libvirtd.enable = true;
 programs.dconf.enable = true;

 # Flatpak
 services.flatpak.enable = true;
 xdg.portal.enable = true;
# xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

 # Non-free
 nixpkgs.config.allowUnfree = true;

 # Podman
 virtualisation.podman.enable = true;

 # ZSH
 programs.zsh.enable = true;
 programs.zsh.ohMyZsh.enable = true;
 programs.zsh.autosuggestions.enable = true;
 programs.zsh.syntaxHighlighting.enable = true;
 #programs.zsh.ohMyZsh.plugins = [ git ]

 # Usbmuxd
 services.usbmuxd.enable = true;

 # Java
 programs.java.enable = true;

 # Starship
 programs.starship.enable = true;


}



