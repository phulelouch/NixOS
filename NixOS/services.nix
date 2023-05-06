{ config, pkgs, ... }:

{

# NetworkManager
networking.networkmanager.enable = true;

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Touchpad support
services.xserver.libinput.enable = true;

# Enable CUPS to print documents.
services.printing.enable = true;

# Bluetooth
hardware.bluetooth.enable = true;

#flatpak
services.flatpak.enable = true;

#qemu
#virtualisation.qemu.guestAgent.enable = true;
services.qemuGuest.enable = true;

services.power-profiles-daemon.enable = false;
# tlp for power managerment
services.tlp.enable = true;

}
