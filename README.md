# NixOS
NixOS, hyprland, took me 3 days, enjoy

![pkgs.nix](https://raw.githubusercontent.com/phulelouch/NixOS/main/20230227_19h07m12s_grim.png)


Situation: You play Tryhackme or HTB you can not do a reverse shell from outside to host through openvpn and you can not create a reverse shell from the machine -> host (nixos machine)

Why is this happen you may ask? Well NixOS have defined some firewall and they are not allowing all port, you need to modified this in:

networking.firewall.allowedTCPPorts = [];

or if you in a hurry and lazy change iptables rules. Here you can flush it all if you don't wanna think:
```
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

sudo systemctl reload firewall 
```
Hope this help someone, cheers
