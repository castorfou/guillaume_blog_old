---
title: "setup wsl2 conda mamba and cuda"
description: best of breed windows + linux
toc: true
comments: true
layout: post
categories: [wsl, cuda, conda]
---



## wsl2 installation and configuration

most of it is explained in an [internal blog entry](https://developers.michelin.com/details/wsl2/wsl2_fundamentals.html).

To display windows version: `winver.exe`

I use version `20H2 build 19042.1415`

#### installation

It is now as easy as to run `wsl --install` in powershell as admin.

Full detail at [MS WSL doc](https://docs.microsoft.com/fr-fr/windows/wsl/install)

Other commands:

```bash
# list all wsl distributions installed and their WSL version
wsl --list --verbose

# list all distributions available
wsl --list --online
Voici la liste des distributions valides qui peuvent être installées.
Installer à l’aide de « wsl --install -d <Distribution> ».

NAME            FRIENDLY NAME
Ubuntu          Ubuntu
Debian          Debian GNU/Linux
kali-linux      Kali Linux Rolling
openSUSE-42     openSUSE Leap 42
SLES-12         SUSE Linux Enterprise Server v12
Ubuntu-16.04    Ubuntu 16.04 LTS
Ubuntu-18.04    Ubuntu 18.04 LTS
Ubuntu-20.04    Ubuntu 20.04 LTS

# install Linux distributions
wsl --install -d <Distribution Name>

# shutdown wsl: shutdown all 
wsl --shutdown 
```



#### configuration

##### wsl-vpnkit

Is is nicely explained in the Michelin blog entry. DNS resolution is kind of broken (I think due to internal protections we use on our corporate PC)

[vpnkit](https://github.com/moby/vpnkit) provides a secured solution to make it work. And sakai135 has packaged it for wsl: [wsl-vpnkit](https://github.com/sakai135/wsl-vpnkit)



The steps to install wsl-vpn kit are:

- Create a working directory on your windows workspace and download this [packaging of wsl-vpnkit](https://github.com/sakai135/wsl-vpnkit/releases/download/v0.2.3/wsl-vpnkit.tar.gz) inside.
- Now, open a powershell and go to the location of wsl-vpnkit.tar.gz, downloaded during the previous step
- On your powershell terminal, launch:

```shell
  #/!\ in powserhsell
  wsl --import wsl-vpnkit $env:USERPROFILE\wsl-vpnkit wsl-vpnkit.tar.gz
  wsl -d wsl-vpnkit
```

- You can now exit your powershell
- For the last step, to ensure all wsl reboot good communication, we will write in .profile file of your ubuntu user wsl-vpnkit initialization command:

```bash
  echo 'wsl.exe -d wsl-vpnkit service wsl-vpnkit start' >> ~/.profile
```

- Relaunch your WSL terminal