{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
      ./pipewire.nix
#      ./hyprland.nix
      #./firefox.nix
    ];

  # Needed for Keychron K2
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
  boot.kernelModules = [ "hid-apple" ];

  hardware.bluetooth.enable = true;

  # Comment this in the first time you want to connect to AirPods.
  # In order to connect, you have to press the button on the back
  # of the AirPods case.
  # `breder` is only needed for the initial connection of the AirPods.
  # Afterwards the mode can be relaxed to `dual` (the default) again.
  #
  hardware.bluetooth.settings = { General = { ControllerMode = "bredr"; }; };

  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd --noplugin=sap,avrcp"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.6"
  ];


  # GRUB/Plymouth
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # boot.kernelPackages = pkgs.linuxPackages_lqx;
  # boot.loader.grub.enable = true;
  # boot.loader.grub.devices = [ "nodev" ];
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.useOSProber = true;
  # boot.plymouth = let pack = 1; theme = "connect"; in { enable = true; themePackages = [ (pkgs.callPackage ./packages/plymouth-theme.nix { inherit pack theme; }) ]; };

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Overlay Packages
  # nixpkgs.overlays = [ (import ./packages) ];

  # Hostname
  networking.hostName = "nixbox"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11/GNOME
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  # Fonts
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      open-sans
      ubuntu_font_family
    ];
  };


  # Configure keymap in X11
  services.xserver.layout = "pl";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # User
  users.defaultUserShell = pkgs.zsh;
  users.users.alone = {
    isNormalUser = true;
    home = "/home/alone";
    description = "alone";
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };


  # SSID
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It???s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
  
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
}
