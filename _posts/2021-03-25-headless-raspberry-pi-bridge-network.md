---
title: "Headless raspberry pi to bridge network"
description: setup headless raspberry pi to bridge wifi (tethering from phone) to ethernet (to wifi-router)
toc: true
comments: true
layout: post
categories: [raspberry pi]
---



## Headless raspberry pi

**Installation on SD from ubuntu**

for a reason, *raspberry pi imager* snap doesn't work (due to a bug linked to QT+wayland).

I download deb ubuntu version (imager_1.6_amd64.deb) from [https://www.raspberry.org/software](https://www.raspberry.org/software) and install with dpkg. (`sudo dpkg -i imager_1.6_amd64.deb`)

With `rpi-imager`, I can install by selecting the default OS (raspberry Pi OS 32-bit), and SD card as storage.

**Headless wifi**

As explained in [https://www.raspberrypi.org/documentation/configuration/wireless/headless.md](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md)

Create (touch) `wpa_supplicant.conf` in `/boot` of SD card and paste this content:

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=FR

network={
 ssid="AndroidAP"
 psk="<Password for your wireless LAN>"
}
```

**Headless ssh**

As explained in [https://www.raspberrypi.org/documentation/remote-access/ssh/README.md](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md)

Create (touch) `ssh` in `/boot` of SD card

If it is found, SSH is enabled and the file is deleted. The content of  the file does not matter; it could contain text, or nothing at all.

## Test installation

Boot. After a couple of minutes, I have a notification on phone saying a device is connected on my phone hotspot.

![](/home/explore/git/guillaume/blog/images/raspberrypi_hotspot.jpg)

And ssh raspberry (default username/password are pi/raspberry)

```bash
$ ssh -l pi 192.168.43.179
pi@192.168.43.179's password: 
Linux raspberrypi 5.4.83-v7+ #1379 SMP Mon Dec 14 13:08:57 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Mar 25 06:23:17 2021

SSH is enabled and the default password for the 'pi' user has not been changed.
This is a security risk - please login as the 'pi' user and type 'passwd' to set a new password.
```

Headless raspberry is ready to be used.

## Wifi to ethernet bridge

I will use [How To: Wifi to Ethernet Bridge(Updated for RPi 3)](https://www.raspberrypi.org/forums/viewtopic.php?t=132674) from raspberrypi.org forum.



This method works by creating a DHCP server on the Pi's ethernet  connection  and internally it 'shares' the internet access between eth0  and wlan0.  A device connected to the Pi's ethernet will get an IP  address from the Pi, not the WiFi, but will still have internet access. 

 I used a jessie light image but it should work with any...  The only  package that is needed is dnsmasq however from a clean install it is a  good idea to make sure everything is up-to-date:

```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install rpi-update dnsmasq -y
sudo rpi-update
```

