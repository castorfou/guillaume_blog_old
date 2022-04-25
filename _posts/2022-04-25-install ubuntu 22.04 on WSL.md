---
title: "install ubuntu 22.04 on WSL"
description: and can be used as a way to create a 2nd instance of WSL
toc: true
comments: true
layout: post
categories: [wsl]
image: images/icons/wsl2.jpeg
---

## source of inspiration

[How to install Ubuntu 21.10 on WSL for Windows 10 and 11](https://www.windowscentral.com/how-install-ubuntu-2110-wsl-windows-10-and-11)



## How to setup it

#### download images

From [cloud images ubuntu](https://cloud-images.ubuntu.com/jammy/current/) (cloud-images > jammy > current), now there are wsl images:

![ubuntu cloud images](https://www.windowscentral.com/sites/wpcentral.com/files/styles/larger/public/field/image/2022/01/ubuntu-cloud-images-website.png)

I just have to download the last jammy (22.04) image `jammy-server-cloudimg-amd64-wsl.rootfs.tar.gz`



#### install and setup from powershell

I have downloaded this ubuntu image to `D:\wsl\ubuntu-22.04\download`

```bash
(base) guillaume@LL11LPC0PQARQ:/mnt/d/wsl$ tree
.
├── Ubuntu-20.04
│   └── ext4.vhdx
├── Ubuntu-22.04
│   ├── download
│   │   └── jammy-server-cloudimg-amd64-wsl.rootfs.tar.gz
│   └── instance
```

and my `ubuntu-22.04` instance will stand in `D:\wsl\ubuntu-22.04\instance`



Install with this command from powershell

```powershell
# wsl --import <distroname> <location of instance> <location of download>
wsl --import ubuntu-22.04 D:\wsl\ubuntu-22.04\instance D:\wsl\ubuntu-22.04\download\jammy-server-cloudimg-amd64-wsl.rootfs.tar.gz
```

It takes 3-4 minutes to install. and should be visible in your wsl instances.

```powershell
 wsl --list --all -v
  NAME            STATE           VERSION
  ubuntu-22.04    Stopped         2
```



then to run it

```powershell
# wsl -d <distroname>
wsl -d ubuntu-22.04
```



###### basic setup

With this way to install, you don't have any user, you don't have any launcher within Windows.

Create a user and add it to sudo:

```bash
# adduser <yourusername>
# usermod -aG sudo <yourusername>
adduser guillaume
usermod -aG sudo guillaume
```

and I can switch to this user simply with

```bash
# su <yourusername>
su guillaume
```



###### launch distro with yourusername - update `wsl.conf`

Manually you can now start your distro with your username from powershell

```powershell
# wsl -d <distroname> -u <yourusername>
wsl -d ubuntu-22.04 -u guillaume
```

Or from another wsl (huge avantage to run in linux terminal instead of powershell)

```bash
wsl.exe -d ubuntu-22.04 -u guillaume
```



but you can better keep this username setting by updating `wsl.conf`

```bash
# /etc/wsl.conf
# Set the user when launching a distribution with WSL.
[user]
default=YourUserName
```



It is now setup. You can now shutdown this instance from powershell.

```powershell
# wsl --shutdown <distroname>
wsl --shutdown ubuntu-22.04
```



and when starting `wsl -d ubuntu-22.04`, you reach your username.



#### use Windows Terminal as a launcher

Windows Terminal is a smart way to group all terminals (powershell, and all your wsl instances)

![windows terminal](../images/windows_terminal.jpg)