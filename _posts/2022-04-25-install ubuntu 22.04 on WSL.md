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



## How to setup it manually

#### uninstall image (if needed)

```powershell
# wsl --unregister <distroName>
wsl --unregister ubuntu-22.04
```





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

It can be installed even with limited windows store access by clicking install in [Installer le Terminal Windows et commencer à le configurer](https://docs.microsoft.com/fr-fr/windows/terminal/install)

Automatically all wsl instances appear in Settings.



## Setup with wsl-vpnkit

as detailed in [setup wsl2 conda mamba and cuda](https://castorfou.github.io/guillaume_blog/blog/wsl2-conda-mamba-cuda.html)



#### wsl-vpnkit

As wsl-vpnkit is already installed, I just have to

```bash
echo 'wsl.exe -d wsl-vpnkit service wsl-vpnkit start' >> ~/.profile
source .bashrc
```

#### gitlab

```bash
ssh-keygen -t rsa -b 4096 -C "WSL2 ubuntu 22.04"
```

and copy `id_rsa.pub` into gitlab > preferences > SSH Keys

#### corporate CA certificates

```bash
git clone git@gitlab.michelin.com:devops-foundation/devops_environment.git /tmp/devops_environment
sudo cp /tmp/devops_environment/certs/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
rm -rf /tmp/devops_environment
```

#### apt sources

had to replace focal (20.04) to jammy (22.04)

```bash
echo 'Acquire { http::User-Agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:13.37) Gecko/20100101 Firefox/31.33.7"; };' | sudo tee /etc/apt/apt.conf.d/90globalprotectconf
sudo sed -i 's@^\(deb \)http://archive.ubuntu.com/ubuntu/\( jammy\(-updates\)\?.*\)$@\1https://artifactory.michelin.com/artifactory/ubuntu-archive-remote\2\n# &@' /etc/apt/sources.list
sudo sed -i 's@^\(deb \)http://security.ubuntu.com/ubuntu/\( jammy\(-updates\)\?.*\)$@\1https://artifactory.michelin.com/artifactory/ubuntu-security-remote\2\n# &@' /etc/apt/sources.list
```

#### check everything is ok

- This command must return google ip:

```bash
  host google.fr
```

- This command must return artifactory ip:

```bash
  host artifactory.michelin.com
```

- You are able to update your distribution without error:

```bash
  sudo apt update
  sudo apt upgrade -y
```



## Setup config dotfiles with whole filesystem (/)

as detailed in [keep dotfiles in git](https://castorfou.github.io/guillaume_blog/blog/keep-dotfiles-in-git.html)

but to manage the whole filesystem.

#### init local repo

```bash
sudo mkdir -p /.cfg
sudo chown guillaume:users /.cfg
git init --bare /.cfg
alias config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/'" >> $HOME/.bash_aliases
cd
source .bashrc
```



#### setup branch and push to central repo

```bash
config remote add origin git@gitlab.michelin.com:janus/dotfiles.git
config fetch
cd
config add .bashrc
config commit -m 'init with .bashrc'

config branch GR_WSL2_ubuntu22.04
config checkout GR_WSL2_ubuntu22.04
config push --set-upstream origin GR_WSL2_ubuntu22.04
```

