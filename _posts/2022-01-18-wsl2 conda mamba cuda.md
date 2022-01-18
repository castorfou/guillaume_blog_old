---
title: "setup wsl2 conda mamba and cuda"
description: best of breed windows + linux
toc: true
comments: true
layout: post
categories: [wsl, cuda, conda]
---



## wsl2 - installation and configuration

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

# define default wsl distribution to use with wsl
wsl -s <DistributionName>
```



#### configuration



##### wsl-vpnkit

It is nicely explained in the Michelin blog entry. DNS resolution is kind of broken (I think due to internal protections we use on our corporate PC)

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



##### git configuration

create a SSH key pair under your distribution

```bash
ssh-keygen -t rsa -b 4096 -C "my SSH key pair for gitlab"
```

Integrate into gitlab using [gitlab doc](https://docs.gitlab.com/ee/ssh/#add-an-ssh-key-to-your-gitlab-account).  (copy `id_rsa.pub` into gitlab > preferences > SSH Keys)



##### Add corporate CA certificates

Michelin SI is behind an ssl proxy with his proper PKI for certificates delivering. That is why, your subsystem must add this pki in her recognized authorities.

To do this, we will clone a repository with the certificates in the subsystem and copy them to ca-certificates:

```bash
git clone git@gitlab.michelin.com:devops-foundation/devops_environment.git /tmp/devops_environment
sudo cp /tmp/devops_environment/certs/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

If everything is ok, terminal notify you that certificates has been added.

You can now clean the temp working folder:

```bash
rm -rf /tmp/devops_environment
```



##### Configure APT

The last step, to have a subsystem ready to use, is to have an apt with Michelin trusted sources configured. Ubuntu based package repositories can’t be used behind Michelin proxy.

Michelin offers its own apt server with artifactory. To configure apt to use artifactory, launch these commands:

```bash
echo 'Acquire { http::User-Agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:13.37) Gecko/20100101 Firefox/31.33.7"; };' | sudo tee /etc/apt/apt.conf.d/90globalprotectconf
sudo sed -i 's@^\(deb \)http://archive.ubuntu.com/ubuntu/\( focal\(-updates\)\?.*\)$@\1https://artifactory.michelin.com/artifactory/ubuntu-archive-remote\2\n# &@' /etc/apt/sources.list
sudo sed -i 's@^\(deb \)http://security.ubuntu.com/ubuntu/\( focal\(-updates\)\?.*\)$@\1https://artifactory.michelin.com/artifactory/ubuntu-security-remote\2\n# &@' /etc/apt/sources.list
```

##### Check if your WSL distribution is working correctly



To verify if everything is OK on your distribution:

- This command must return google ip:

```
  host google.fr
```

- This command must return artifactory ip:

```
  host artifactory.michelin.com
```

- You are able to update your distribution without error:

```
  sudo apt update
  sudo apt upgrade -y
```



## Conda Mamba - installation and configuration

#### conda installation

```bash
tmpdir=$(mktemp -d)
cd $tmpdir
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
# answer yes to question Do you wish the installer to initialize Miniconda3 by running conda init?
bash Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3

>> ==> For changes to take effect, close and re-open your current shell. <==
```

With this configuration, conda will be activate at startup. If you'd prefer that conda's base environment not be activated on startup,   set the auto_activate_base parameter to false: `conda config --set auto_activate_base false`

#### conda configuration

As we have in-house CA certificates, and conda uses its own CA certificates (in `~/miniconda3/ssl`)

We have to change this behaviour and ask conda to use system CA certifcates.

At the end of `.bash_rc`, add `export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt` 

#### mamba installation

```bash
conda install mamba -n base -c conda-forge
mamba init
```

#### installation jupyter - nb_kernels

```bash
mamba install nb_conda_kernels
```

#### create conda envt - fastai (v2.5.3) (optional)

```bash
mamba create --name fastai
mamba activate fastai
mamba install -c fastai -c pytorch fastai
mamba install ipykernel
```

